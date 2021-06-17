
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/data/datasource/locale/MySharedPreferences.dart';
import 'package:whatsappy/presentation/ui/intro/IntroActivity.dart';
import 'package:whatsappy/presentation/ui/main/MainActivity.dart';
import 'package:whatsappy/presentation/utils/navigation/NavigationHelper.dart';

class IntroController extends GetxController {


  MySharedPreferences mySharedPreferences = new MySharedPreferences();


  Widget startValidation() {

    if (mySharedPreferences.isIntroDisplayed) {
      return MainActivity();
    } else {
      return IntroActivity();
    }
  }

  void onDonePress() {
    mySharedPreferences.setIsIntroDisplayed().then((value) => startMainActivity());
  }

}