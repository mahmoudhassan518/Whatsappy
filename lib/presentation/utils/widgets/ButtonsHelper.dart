
import 'package:flutter/material.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';


RoundedRectangleBorder borderRectangleButtonDecoration(
    {borderColor, double borderWidth = 0}) {

  return RoundedRectangleBorder(
    borderRadius: new BorderRadius.circular(decorationRectangle),
    side: BorderSide(
        color: borderColor ?? Colors.transparent,
        width: borderWidth == 0 ? 0 : borderWidth),
  );
}


ButtonStyle buttonStyle({Color? buttonColor}) {
  return ButtonStyle(

    // padding:MaterialStateProperty.all(EdgeInsets.zero) ,
    backgroundColor: buttonColor == null
        ? MaterialStateProperty.all(colorPrimaryDark)
        : MaterialStateProperty.all(buttonColor),
  );
}
