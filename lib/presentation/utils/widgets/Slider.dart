import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

Slide customSlider(
    {String? title,
    String? description,
    String? imagePath,
    Color? backgroundColor}) {
  return Slide(
    title: title,
    styleTitle: TextStyle(
        color: Colors.white,
        fontSize: headLine,
        fontWeight: FontWeight.bold,
        fontFamily: 'RobotoMono'),
    description: description,
    styleDescription: TextStyle(
        color: Colors.white,
        fontSize: h4,
        fontStyle: FontStyle.normal,
        fontFamily: 'Raleway'),
    pathImage: imagePath,
    // backgroundColor: backgroundColor,
    colorBegin: colorGoogleYellow,
    colorEnd: backgroundColor,
    directionColorBegin: Alignment.topRight,
    directionColorEnd: Alignment.bottomLeft,
  );
}


Widget optionsText({String title = ""}) {

  return Text(title, style: TextStyle(color: Colors.white, fontSize: h4));
}


Widget renderNextBtn() {
  // return Icon(
  //   Icons.navigate_next,
  //   color: Color(0xffD02090),
  //   size: 24.0,
  // );

  return optionsText(title: "Next".toUpperCase());

}

Widget renderDoneBtn() {
  // return Icon(
  //   Icons.done,
  //   color: Color(0xffD02090),
  // );

  return optionsText(title: "Done".toUpperCase());

}

Widget renderSkipBtn() {
  // return Icon(
  //   Icons.skip_next,
  //   color: Color(0xffD02090),
  // );

  return optionsText(title: "Skip".toUpperCase());
}
