import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:get/get.dart';


import 'ContainersHelper.dart';
import 'TextFieldsHelper.dart';

Row bottomAreaOptions(Function() onDeletePressed) {
  return Row(children: [
    Expanded(
      child: Text(
        'recent'.tr,
        style: TextStyle(
            color: Colors.black, fontSize: h4, fontWeight: FontWeight.w600),
      ),
    ),
    InkWell(
      onTap: () => onDeletePressed.call(),
      child: Icon(
        Icons.delete_forever,
        color: colorGoogleRed,
      ),
    )
  ]);
}

Widget loadingWidget(BuildContext context) {
  return Container(
    // color: Colors.transparent, //
    child: Align(
      child: CircularProgressIndicator(),
    ),
  );
}



Widget buildSearchNumberRow(
    {Function(CountryCode value)? onCodeChange,
    Function(String text)? onTextChanged,
    String? initialCountryCode,
    String? initialDialCode,}) {
  return Row(
    children: [
      Container(
        height: 48,
        decoration: boxDecoration(shapeColor: colorPrimaryDark),
        child: CountryCodePicker(
          // onChanged: _controller.onCodeChange,
          onChanged: (value)=> onCodeChange!.call(value),
          textStyle: TextStyle(color: onPrimary, fontSize: h3),
          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          initialSelection: initialCountryCode??"EG",
          favorite: [initialDialCode??"+20", initialCountryCode??"EG"],
          // optional. Shows only country name and flag
        ),
      ),
      SizedBox(
        width: smallPadding,
      ),
      Expanded(
        child: Container(
          height: 48,
          decoration: boxDecoration(shapeColor: colorPrimaryDark),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            autofocus: false,
            style: TextStyle(color: onPrimary, fontSize: h3),
            maxLines: 1,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(15),
              FilteringTextInputFormatter.digitsOnly,
            ],
            // textInputAction: TextInputAction.send,
            onChanged: (value)=> onTextChanged!.call(value),
            decoration: inputDecorationWithoutAnimation(
              label: "",
            ),
          ),
        ),
      ),
    ],
  );
}