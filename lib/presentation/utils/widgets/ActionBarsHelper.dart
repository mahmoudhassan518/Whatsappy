import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

AppBar titleActionBar({String title = "", List<Widget>? actions}) {
  return AppBar(
    actions: actions,
    automaticallyImplyLeading: false,
    title: Text(
      title = title,
      style: TextStyle(color: onPrimary, fontSize: h4),
    ),
    centerTitle: false,
    brightness: Brightness.dark,
    elevation: 0,
    iconTheme: IconThemeData(
      color: onPrimary,
    ),
  );
}

AppBar backActionBar({String title = "", List<Widget>? actions}) {
  return AppBar(
    actions: actions,
    automaticallyImplyLeading: true,
    leading: IconButton(
        icon: Icon(Icons.arrow_back, color: onPrimary),
        onPressed: () => Get.back()),
    title: Text(
      title = title,
      style: TextStyle(color: onPrimary, fontSize: h4),
    ),
    centerTitle: false,
    brightness: Brightness.dark,
    elevation: appBarElevation,
    iconTheme: IconThemeData(
      color: onPrimary,
    ),
  );
}

AppBar closeActionBar({String title = "", List<Widget>? actions}) {
  return AppBar(
    actions: actions,
    automaticallyImplyLeading: true,
    leading: IconButton(
        icon: Icon(Icons.close, color: onPrimary),
        onPressed: () => Get.back()),
    title: Text(
      title = title,
      style: TextStyle(color: onPrimary, fontSize: h4),
    ),
    centerTitle: false,
    brightness: Brightness.dark,
    elevation: appBarElevation,
    iconTheme: IconThemeData(
      color: onPrimary,
    ),
  );
}
