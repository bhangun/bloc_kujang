import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
import '../generated/localization.dart';
import '../layout/mobile.dart';
import '../utils/config.dart';
import 'textfield_widget.dart';

class LoginBodyWidget extends StatelessWidget {
  final TextEditingController? passwordController;

  final TextEditingController? userEmailController;

  final FocusNode? passwordFocusNode;

  final bool? isObscure;

  final String? forgotPassword;
  
  final Function? onEyePressed;
  final Function? onForgotPassword;
  
  
  final bool? isEyeOpen;

  const LoginBodyWidget(
      {this.forgotPassword,
      this.isObscure,
      this.passwordController,
      this.passwordFocusNode,
      this.userEmailController, this.onEyePressed, this.isEyeOpen, this.onForgotPassword});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: MobileLayout(
      rightChild: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            IMAGE_SPLASH,
            width: 60,
            height: 60,
          ),
          SizedBox(height: 24.0),
          _userIdField(),
          _passwordField(),
          _forgotPasswordButton(),
          _signInButton(),
        ],
      ),
      leftChild: SizedBox.expand(
          child: SvgPicture.asset(
        IMAGE_SPLASH,
        width: 100,
        height: 100,
      )),
      showProgress: false,
    ));
  }

  Widget _userIdField() =>
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        FLog.info(text: '>>>>>>>' + state.status.toString());
        return TextFieldWidget(
          hint: AppLocalizations.of(context)!.email,
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: Colors.black54,
          textController: userEmailController,
          inputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(passwordFocusNode);
          },
          errorText: context.read<AuthBloc>().userMessage,
        );
      });

  Widget _passwordField() =>
      BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        FLog.info(text: '>>>>>>>' + state.status.toString());
        return TextFieldWidget(
          hint: AppLocalizations.of(context)!.password,
          isObscure: isObscure!,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: Colors.black54,
          textController: passwordController,
          focusNode: passwordFocusNode,
          errorText: context.read<AuthBloc>().passwordMessage,
          onEyePressed: () => onEyePressed,
          isEyeOpen: isEyeOpen,
          showEye: true,
        );
      });

  Widget _forgotPasswordButton() => Align(
      alignment: FractionalOffset.centerRight,
      child: TextButton(
          key: Key('user_forgot_password'),
          child: Text(forgotPassword!),
          onPressed: () => onForgotPassword));

  Widget _signInButton() => BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        FLog.info(text: '>>>>>>>' + state.status.toString());
        return ElevatedButton(
          key: Key('user_sign_button'),
          onPressed: () => context.read<AuthBloc>().add(LoginButtonPressed()),
          child: Text(AppLocalizations.of(context)!.sign_in!),
        );
      });
}
