import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/country_pickers.dart';
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
            onPressed: () =>
                {onLanguageOneClicked.call(), Navigator.of(context).pop()},
            child: Text('$languageOne'),
          ),
          SimpleDialogOption(
            onPressed: () =>
                {onLanguageTwoClicked.call(), Navigator.of(context).pop()},
            child: Text('$languageTwo'),
          ),
        ],
      );
    },
  );
}

void openCountryPickerDialog({required BuildContext context,
    required Function(Country country) onValuePicked}) =>
    showDialog(
      context: context,
      builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
              titlePadding: EdgeInsets.all(8.0),
              searchCursorColor: Colors.black,
              searchInputDecoration: InputDecoration(hintText: 'Search...'),
              isSearchable: true,
              title: Text('Select your phone code'),
              onValuePicked: (Country country) =>
                  onValuePicked.call(country),
              priorityList: [
                CountryPickerUtils.getCountryByIsoCode('TR'),
                CountryPickerUtils.getCountryByIsoCode('US'),
              ],
              itemBuilder: _buildDialogItem)),
    );

Widget _buildDialogItem(Country country) => Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Text("+${country.phoneCode}"),
        SizedBox(width: 8.0),
        Flexible(
          child: Text(country.name),
          flex: 1,
        )
      ],
    );
