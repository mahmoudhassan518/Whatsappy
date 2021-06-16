
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/data/datasource/locale/MySharedPreferences.dart';
import 'package:whatsappy/presentation/ui/intro/IntroActivity.dart';
import 'package:whatsappy/presentation/ui/main/MainActivity.dart';

class SplashController extends GetxController {


  MySharedPreferences mySharedPreferences = new MySharedPreferences();


  Widget startValidation() {

    if (mySharedPreferences.isIntroDisplayed) {
      return MainActivity();
    } else {
      return IntroActivity();
    }
  }

}