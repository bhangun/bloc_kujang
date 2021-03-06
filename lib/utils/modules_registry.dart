

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_kujang/modules/register_modules.dart';
import 'package:logging/logging.dart';

import 'modules.dart';

class ModulesRegistry {
  final log = Logger('AuthBloc');
  // singleton object
  static final ModulesRegistry _singleton = ModulesRegistry._();

  // factory method to return the same object each time its needed
  factory ModulesRegistry() =>  _singleton;

  ModulesRegistry._(){
    _registry();
  }
 
  static final _blocProvider = [];

  _registry(){
    registerModules().forEach((m){
        m.screens().forEach((p){
          p.name = m.name;
          Modules.addscreens(p);
        });

        log.info(m.providers());


        _blocProvider.add(m.providers());
        m.routes();
        m.services();
    });
  }

  static  providers(){
    return _blocProvider;
  }
}



