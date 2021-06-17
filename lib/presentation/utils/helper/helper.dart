

import 'package:get/get.dart';

void showSnackBar({String? title, String? content}) {
  Get.snackbar(
    title??"",
    content??"",
  );
}