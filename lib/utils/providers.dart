

import 'package:bloc_kujang/models/module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc/app.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/locale_cubit.dart';
import '../bloc/theme_cubit.dart';

class  MyProviders {
  static var _pages  = <Page>[];

  static addPages(Page newPages){
    _pages.add(newPages);
  }

  static List<BlocProvider> get providers => 
     [
      BlocProvider(
        create: (_) => ThemeCubit(),
      ),
      BlocProvider(
        create: (_) => LocaleCubit(),
      ),
      BlocProvider<AppBloc>(
        create: (_) => AppBloc(AppState.initializing()),
      ),
      BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(AuthState.unauthenticated()),
      ),
    ];
}
