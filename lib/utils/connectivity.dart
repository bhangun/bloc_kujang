import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityUtils {

  static  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    }
  }
}
