
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Module {
  String? name;
  List<Page> pages();
  void services();
  List<BlocProvider> providers();
  void routes();
}


class Page{
  String? name;
  String? title;
  String? route;
  bool showInDrawer;
  bool showInHome;

  Page(
      {
        this.name,
        this.title,
        this.route,
        this.showInDrawer = false,
        this.showInHome = false});
}
