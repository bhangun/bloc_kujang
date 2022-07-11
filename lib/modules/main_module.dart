import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_kujang/models/module.dart';
import 'package:bloc_kujang/services/apps_routes.dart';
import 'package:bloc_kujang/bloc/theme_cubit.dart';

import '../bloc/app_bloc/app.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/locale_cubit.dart';
import '../utils/routes.dart';
import 'account/services/user_routes.dart';

class MainModule implements Module {
  @override
  String? name = 'Main';

  @override
  screens() {
    return [
      Screen(title: 'User Detail', route: UserRoutes.userDetail),
      Screen(title: 'User Form', route: UserRoutes.userForm),
      Screen(
          title: 'User List',
          route: UserRoutes.userList,
          showInDrawer: true,
          showInHome: true)
    ];
  }

  @override
  services() {}

  @override
  List<BlocProvider> providers() {
    return [
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

  @override
  void routes() {
    RoutesService.addRoutes(AppsRoutes.routes);
    RoutesService.addRoutes(UserRoutes.routes);
  }
}
