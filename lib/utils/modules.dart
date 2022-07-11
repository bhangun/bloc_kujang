

import 'package:bloc_kujang/models/module.dart';

class Modules {
  static var _screens  = <Screen>[];

  static addscreens(Screen newscreens){
    _screens.add(newscreens);
  }

  static List<Screen> get screens => _screens;
}
