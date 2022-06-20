import 'package:f_logs/f_logs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io' show Platform;

class KutBlocObserver extends BlocObserver {
  checkPlatform() {
    if (Platform.isAndroid) {
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
    }
    /* Platform.isAndroid
  Platform.isFuchsia
  Platform.isIOS
  Platform.isLinux
  Platform.isMacOS
  Platform.isWindows */
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    FLog.info(text: '<><><><><><>??? '+event.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
   FLog.info(text:transition.toString());
    // Transition { currentState: ThemeData#e0c60, event: null, nextState: ThemeData#62398 }
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
   FLog.info(text:error.toString());
    super.onError(bloc, error, stackTrace);
  }
}
