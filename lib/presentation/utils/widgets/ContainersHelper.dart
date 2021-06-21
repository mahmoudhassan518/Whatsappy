
import 'package:flutter/material.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

Decoration boxDecoration({Color? shapeColor, double borderRadius = decorationRectangle}) {
  return BoxDecoration(
    color: shapeColor?? Colors.transparent,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius)));
}
