import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_kujang/models/module.dart';
import 'package:bloc_kujang/bloc/theme_cubit.dart';

import '../../utils/routes.dart';
import 'ko_routes.dart';

class KoModule implements Module {
  @override
  String? name = 'Main';

  @override
  screens() {
    return [
      Screen(title: 'User Detail', route: KoRoutes.koHome),
      Screen(title: 'User Form', route: KoRoutes.kojekHome),
      Screen(title: 'User Form', route: KoRoutes.koPayHome),
      Screen(title: 'User Form', route: KoRoutes.koSendHome),
      Screen(title: 'User Form', route: KoRoutes.koShopHome),
      Screen(
          title: 'User List',
          route: KoRoutes.koMartHome,
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
     
    ];
  }

  @override
  void routes() {
    RoutesService.addRoutes(KoRoutes.routes);
  }
}
