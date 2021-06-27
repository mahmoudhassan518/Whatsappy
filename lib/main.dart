import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsappy/presentation/ui/intro/IntroController.dart';
import 'package:whatsappy/presentation/ui/lang/LanguageController.dart';
import 'package:whatsappy/presentation/ui/main/MainController.dart';
import 'package:whatsappy/presentation/ui/main/screens/chats/ChatsController.dart';
import 'package:whatsappy/presentation/ui/main/screens/links/LinksController.dart';
import 'package:whatsappy/presentation/ui/main/screens/settings/SettingsController.dart';
import 'package:whatsappy/presentation/ui/main/screens/templates/TemplatesController.dart';
import 'package:whatsappy/presentation/ui/splash/SplashController.dart';
import 'package:whatsappy/presentation/ui/template_details/TemplateDetailsController.dart';
import 'package:whatsappy/presentation/utils/navigation/Router.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Translation.dart';

import 'core/BaseController.dart';
import 'data/datasource/locale/MySharedPreferences.dart';
import 'di/Injector.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.initializeApp();


  await configureInjector();
  Get.put(BaseController());
  Get.put(SplashController());
  Get.put(MainController());
  Get.put(ChatsController());
  Get.put(TemplatesController());
  Get.put(TemplateDetailsController());
  Get.put(LinksController());
  Get.put(SettingsController());
  Get.put(LanguageController());
  Get.lazyPut(() => IntroController());

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);


  runApp(
      getMaterialApp(),
    );

}

GetMaterialApp getMaterialApp() {


  MySharedPreferences _prefs = MySharedPreferences();

  return GetMaterialApp(
    translations: Translation(),
    locale: Locale(_prefs.locale.code),

    debugShowCheckedModeBanner: false,

    title: 'APP',

    theme: new ThemeData(
      primaryColor: colorPrimary,
      primaryColorDark: colorPrimaryDark,
      accentColor: colorPrimary,
    ),

    onGenerateRoute: RouterHelper.generateRoute,

    //  initialRoute: homeRoute,
  );
}
