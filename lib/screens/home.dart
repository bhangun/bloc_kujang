import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_kujang/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_kujang/widgets/bottom_bar_widget.dart';

import '../widgets/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _Homescreenstate createState() => _Homescreenstate();
}

class _Homescreenstate extends State<HomeScreen> {
  final _homeKey = GlobalKey<ScaffoldState>();

  var subscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (constext, count) {
      return Scaffold(
        key: _homeKey,
        appBar: KutAppBar(
          title: 'Home ',
          onLogout: ()=>test(),
        ),
        body: _buildBody(),
        // drawer: CommonDrawer(),
        bottomNavigationBar: KutBotomBar(),
      );
    });
  }

  void test() {
    context.read<AuthBloc>().add(LoggedOut());
    //NavigationServices.navigateTo(AppsRoutes.login);
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        Text('data')
        /*  Container(); //_authBloc.loggedIn
                
          },
        ),
        Observer(
          key: Key('error'),
          builder: (context) {
            return //_authBloc.success
                 Container();
                
          },
        ) */
      ],
    );
  }
}
