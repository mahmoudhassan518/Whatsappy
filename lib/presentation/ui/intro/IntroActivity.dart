import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:whatsappy/domain/models/SliderData.dart';
import 'package:whatsappy/presentation/utils/widgets/Slider.dart';

import 'IntroController.dart';

class IntroActivity extends StatelessWidget {
  const IntroActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {

  final IntroController controller = Get.find();


  @override
  void initState() {
    super.initState();
  }

  void onDonePress() {

    controller.onDonePress();
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: SliderHolder.getSliderList(),

      // Skip button
      renderSkipBtn: renderSkipBtn(),
      // colorSkipBtn: Color(0x33000000),
      // highlightColorSkipBtn: Color(0xff000000),

      // Next button
      renderNextBtn: renderNextBtn(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: this.onDonePress,
      // colorDoneBtn: Color(0x33000000),
      // highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: CupertinoColors.systemGrey,
      colorActiveDot: Colors.white,
      sizeDot: 12.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,

      // Scrollbar
      // verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}
