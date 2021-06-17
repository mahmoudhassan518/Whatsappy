import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsappy/data/model/others/Constants.dart';

class MySharedPreferences {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> initializeApp() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  Future setIsIntroDisplayed() async {
    return await _prefs.setBool(isIntroDisplayedKey, true);
  }

  bool get isIntroDisplayed => _prefs.getBool(isIntroDisplayedKey) ?? false;
}
