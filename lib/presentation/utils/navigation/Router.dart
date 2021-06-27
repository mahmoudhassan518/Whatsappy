import 'package:flutter/material.dart';
import 'package:whatsappy/data/model/others/Routes.dart';
import 'package:whatsappy/presentation/ui/intro/IntroActivity.dart';
import 'package:whatsappy/presentation/ui/main/MainActivity.dart';
import 'package:whatsappy/presentation/ui/splash/SplashActivity.dart';

class RouterHelper {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startRoute:
        return MaterialPageRoute(builder: (_) => SplashActivity());
      case mainRoute:
        return MaterialPageRoute(builder: (_) => MainActivity());
      case introRoute:
        return MaterialPageRoute(builder: (_) => IntroActivity());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
