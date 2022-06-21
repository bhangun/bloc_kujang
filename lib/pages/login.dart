import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:bloc_kujang/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_kujang/bloc/locale_cubit.dart';

import 'package:bloc_kujang/generated/localization.dart';
import 'package:bloc_kujang/layout/mobile.dart';
import 'package:bloc_kujang/bloc/theme_cubit.dart';
import 'package:bloc_kujang/modules/kojek/ko_routes.dart';
//import 'package:bloc_kujang/services/apps_routes.dart';
import 'package:bloc_kujang/services/navigation.dart';

import '../utils/config.dart';
import '../widgets/login_body_widget.dart';
import '../widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _Loginpagestate createState() => _Loginpagestate();
}

class _Loginpagestate extends State<LoginScreen> {
  // text controllers
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //focus node
  late FocusNode _passwordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  bool _isEyeOpen = true;

  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();

    _userEmailController.addListener(() {
      // this will be called whenever user types in some value
      context.read<AuthBloc>().setUserId(_userEmailController.text);
    });
    _passwordController.addListener(() {
      //this will be called whenever user types in some value
      context.read<AuthBloc>().setPassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          FLog.info(text: state.status.toString());
          if (state.isAuthenticated) {
            // NavigationServices.navigateTo(AppsRoutes.home);
          } else if (state.failure)
            _showModal('failure');
          else
            _showModal('wrong');
        },
        child: Scaffold(
            primary: true,
            appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                actions: [
                  IconButton(
                    splashRadius: 15,
                    color: Theme.of(context).buttonColor,
                    icon: Icon(Icons.pedal_bike),
                    onPressed: () =>
                        NavigationServices.navigateTo(KoRoutes.koHome),
                  ),
                  IconButton(
                    splashRadius: 15,
                    color: Theme.of(context).buttonColor,
                    icon: Icon(Icons.brightness_6),
                    onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                  ),
                  IconButton(
                      splashRadius: 15,
                      color: Theme.of(context).buttonColor,
                      icon: Icon(Icons.flag),
                      onPressed: () => _showLocales()),
                ]),
            body: LoginBodyWidget(
                isObscure: _isObscure,
                passwordController: _passwordController,
                passwordFocusNode: _passwordFocusNode,
                userEmailController: _userEmailController,
                onEyePressed: _onEyePressed(),
                onForgotPassword: _onForgotPassword(context),
                forgotPassword:
                    AppLocalizations.of(context)!.forgotPassword!)));
  }

  _onForgotPassword(context){
    context.read<AuthBloc>().forgotPassword();
  }

  _onEyePressed() {
    setState(() {
      _isEyeOpen = _isEyeOpen ? false : true;
      _isObscure = _isEyeOpen ? true : false;
    });
  }

  _showLocales() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200,
              child: ListView(
                children: [
                  _localeBtn('Bahasa', 'ID'),
                  _localeBtn('English', 'EN'),
                ],
              ));
        });
  }

  _localeBtn(title, key) {
    return TextButton(
        child: Text(title), onPressed: () => _onLocalePressed(key));
  }

  _onLocalePressed(key) {
    context.read<LocaleCubit>().switchLocale(key);
  }

  _showModal(text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      action: SnackBarAction(
        label: 'Action',
        onPressed: () {
          // Code to execute.
        },
      ),
      content: Text(text),
      duration: Duration(milliseconds: 1500),
      width: 280.0, // Width of the SnackBar.
      padding: EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }
}
