import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsappy/presentation/ui/main/MainController.dart';
import 'package:whatsappy/presentation/ui/splash/SplashController.dart';
import 'package:whatsappy/presentation/utils/navigation/Router.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';

void main() {
  Get.put(SplashController());
  Get.put(MainController());

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'APP',

      theme: new ThemeData(
        primaryColor: colorPrimary,
        primaryColorDark: colorPrimaryDark,
        accentColor: colorPrimary,
      ),

      onGenerateRoute: RouterHelper.generateRoute,

      //  initialRoute: homeRoute,
    ),
  );
}
