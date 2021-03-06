import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/apps_routes.dart';
import '../utils/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
  }

  @override
  State<StatefulWidget> createState() => _Splashscreenstate();
}

class _Splashscreenstate extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: SvgPicture.asset(IMAGE_SPLASH)),
    );
  }

  startTimer() {
    var _duration = const Duration(milliseconds: 300);
    return Timer(_duration, navigate);
  }

  navigate() async {
    Navigator.of(context).pushReplacementNamed(AppsRoutes.login);
  }
}
