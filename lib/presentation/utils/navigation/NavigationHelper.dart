import 'package:get/get.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/presentation/ui/intro/IntroActivity.dart';
import 'package:whatsappy/presentation/ui/lang/LanguageActivity.dart';
import 'package:whatsappy/presentation/ui/main/MainActivity.dart';
import 'package:whatsappy/presentation/ui/splash/SplashActivity.dart';
import 'package:whatsappy/presentation/ui/template_details/TemplatesDetails.dart';

startSplashActivity() {
  Get.to(() => SplashActivity());
}

startLanguageActivity() {
  Get.to(() => LanguageActivity());
}

startMainActivity() {
  Get.off(() => MainActivity());
}

startIntroActivity() {
  Get.off(() => IntroActivity());
}

startTemplatesDetails(NumberObject item) {
  Get.to(() => TemplatesDetailsActivity(item));
}

