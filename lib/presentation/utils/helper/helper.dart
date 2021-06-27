import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({String? title, String? content}) {
  Get.snackbar(
    title ?? "",
    content ?? "",
  );
}

Future<void> showMyDialog(BuildContext context,
    {String? title,
    String? content,
    String? positiveText,
    String? negativeText,
    required Function onPositiveClicked}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$title'),
        content: Text('$content'),
        actions: <Widget>[
          TextButton(
            child: Text(positiveText ?? 'confirm'.tr),
            onPressed: () =>
                {onPositiveClicked.call(), Navigator.of(context).pop()},
          ),
          TextButton(
            child: Text(negativeText ?? 'cancel'.tr),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showLanguageDialog(
    {String? title,
    String? content,
    String? languageOne,
    String? languageTwo,
    required BuildContext context,
    required Function onLanguageOneClicked,
    required Function onLanguageTwoClicked}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$title'),
        content: Text('$content'),
        actions: <Widget>[
          SimpleDialogOption(
            onPressed: () => {onLanguageOneClicked.call(), Navigator.of(context).pop()},
            child: Text('$languageOne'),
          ),
          SimpleDialogOption(
            onPressed: () => {onLanguageTwoClicked.call(), Navigator.of(context).pop()},
            child: Text('$languageTwo'),
          ),
        ],
      );
    },
  );
}
