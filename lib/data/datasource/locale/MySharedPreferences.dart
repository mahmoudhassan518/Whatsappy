import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsappy/data/model/others/Constants.dart';
import 'package:whatsappy/domain/models/LanguageData.dart';

class MySharedPreferences {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> initializeApp() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  Future setIsIntroDisplayed() async {
    return await _prefs.setBool(isIntroDisplayedKey, true);
  }

  Future setIsLangDisplayed() async {
    return await _prefs.setBool(isLangDisplayedKey, true);
  }

  bool get isIntroDisplayed => _prefs.getBool(isIntroDisplayedKey) ?? false;

  bool get isLangDisplayed => _prefs.getBool(isLangDisplayedKey) ?? false;

  Future setLang(LanguageData data) async {
    String langData = jsonEncode(data.toJson());
    return await _prefs.setString(lang, langData);
  }

  LanguageData get locale {
    String? cashedData = _prefs.getString(lang);
    try{
      if (cashedData != null)
        return LanguageData.fromJson(jsonDecode(cashedData));
      else
        return LanguageData(
            code: 'en', value: 'English', isChecked: false, countryCode: 'US');
    }catch(e) {
      return LanguageData(
          code: 'en', value: 'English', isChecked: false, countryCode: 'US');
    }
  }
}
