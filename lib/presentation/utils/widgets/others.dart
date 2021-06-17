import 'package:flutter/material.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

Row bottomAreaOptions(Function() onDeletePressed) {
  return Row(children: [
    Expanded(
      child: Text(
        "Recent",
        style: TextStyle(
            color: Colors.black, fontSize: h4, fontWeight: FontWeight.w600),
      ),
    ),
    InkWell(
      onTap: onDeletePressed,
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