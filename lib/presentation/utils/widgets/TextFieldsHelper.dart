import 'package:flutter/material.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';




InputDecoration inputDecorationWithoutAnimation({String? label}) {
  return InputDecoration(

      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: label??"",
    contentPadding: EdgeInsets.all(generalPadding),
    hintStyle: TextStyle(color: onPrimary, fontSize: h3),
  );
}

