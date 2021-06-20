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
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$title'),
        content: Text('$content'),
        actions: <Widget>[
          TextButton(
            child: Text(positiveText ?? "Confirm"),
            onPressed: () => {
              onPositiveClicked.call(),
              Navigator.of(context).pop()
            },
          ),
          TextButton(
            child: Text(negativeText ?? "Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
