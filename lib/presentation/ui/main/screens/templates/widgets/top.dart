import 'package:flutter/material.dart';
import 'package:whatsappy/presentation/ui/main/screens/templates/TemplatesController.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

class Top extends StatelessWidget {

  TemplatesController controller;


  Top(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(generalPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          "Templates",
          style: TextStyle(color: colorGreyLight, fontSize: headLine),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: smallPadding,
        ),
        Text(
          "Create messages which you send frequently on whatsapp, add more by clicking on Add",
          style: TextStyle(color: onPrimary, fontSize: h3),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}