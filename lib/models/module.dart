
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Module {
  String? name;
  List<Screen> screens();
  void services();
  List<BlocProvider> providers();
  void routes();
}


class Screen{
  String? name;
  String? title;
  String? route;
  bool showInDrawer;
  bool showInHome;

  Screen(
      {
        this.name,
        this.title,
        this.route,
        this.showInDrawer = false,
        this.showInHome = false});
}
