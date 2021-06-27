import 'package:get/get.dart';
import 'package:whatsappy/data/datasource/locale/MySharedPreferences.dart';
import 'package:whatsappy/di/Injector.dart';

class SettingsController extends GetxController {

  var language = "".obs;

  MySharedPreferences _prefs = getIt<MySharedPreferences>();

  SettingsController() {
    updateLanguage();
  }

  updateLanguage() {
    language.value = _prefs.locale.value;
  }

}