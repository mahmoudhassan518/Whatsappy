import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/data/datasource/locale/MySharedPreferences.dart';
import 'package:whatsappy/di/Injector.dart';
import 'package:whatsappy/domain/models/LanguageData.dart';
import 'package:whatsappy/presentation/utils/navigation/NavigationHelper.dart';

class LanguageController extends GetxController {
  var languages = LanguageData.getLanguagesData().obs;
  late LanguageData selected;

  MySharedPreferences _prefs = getIt<MySharedPreferences>();

  LanguageController() {
    _updateList(_prefs.locale);
  }

  updateLocale(LanguageData data) {

    // var locale = Locale(data.code);
    // Get.updateLocale(locale);
    _updateList(data);
  }

  void _updateList(LanguageData data) {
    selected = data;
    languages.value = languages.map((element) => _updateItem(element)).toList();
  }

  LanguageData _updateItem(LanguageData element) {
    element.isChecked = (element.code == selected.code);
    return element;
  }

  onDonePress() {

    _setCashLocale(selected);
  }

  _setCashLocale(LanguageData data) {
    var locale = Locale(data.code);
    Get.updateLocale(locale);

    _prefs
        .setIsLangDisplayed()
        .then((value) => _prefs.setLang(data))
        .then((value) => startValidation());
  }

  startValidation() {
    if (_prefs.isIntroDisplayed) {
      startMainActivity();
    } else {
      startIntroActivity();
    }
  }
}
