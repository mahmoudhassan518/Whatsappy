import 'package:get/get.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/presentation/ui/intro/IntroActivity.dart';
import 'package:whatsappy/presentation/ui/main/MainActivity.dart';
import 'package:whatsappy/presentation/ui/splash/SplashActivity.dart';
import 'package:whatsappy/presentation/ui/template_details/TemplatesDetails.dart';

startSplashActivity() {
  Get.to(() => SplashActivity());
}

startMainActivity() {
  Get.off(() => MainActivity());
}

startIntroActivity() {
  Get.off(() => IntroActivity());
}
startTemplatesDetails(TemplatesHistory item) {
  Get.to(() => TemplatesDetailsActivity(item));
}

// startLoginActivity() {
//   // To go to the next screen and no option to go back to the previous screen
//   // (for use in SplashScreens, login screens, etc.)
//   Get.off(() => LoginActivity());
// }

// startRegisterActivity() {
//   // Navigate to a new screen:
//   Get.to(() => RegisterActivity());
// }
