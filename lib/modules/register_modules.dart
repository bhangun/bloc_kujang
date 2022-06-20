import 'package:bloc_kujang/models/module.dart';
import 'package:bloc_kujang/modules/kojek/ko_module.dart';
import 'main_module.dart';

List<Module> registerModules(){
  return [
    MainModule(),
    KoModule(),
  ];
}