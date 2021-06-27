import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/data/datasource/locale/MySharedPreferences.dart';
import 'package:whatsappy/di/Injector.dart';
import 'package:whatsappy/presentation/ui/intro/IntroActivity.dart';
import 'package:whatsappy/presentation/ui/lang/LanguageActivity.dart';
import 'package:whatsappy/presentation/ui/main/MainActivity.dart';

class SplashController extends GetxController {
  MySharedPreferences _prefs = getIt<MySharedPreferences>();

  Widget startValidation() {
    if (!_prefs.isLangDisplayed) {
      return LanguageActivity();
    } else {
      return validateIntroDisplayedStatus();
    }
  }

  Widget validateIntroDisplayedStatus() {
    if (!_prefs.isIntroDisplayed) {
      return IntroActivity();
    } else {
      return MainActivity();
    }
  }
}
