import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/presentation/ui/main/screens/chats/ChatsController.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ButtonsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';



// ignore: must_be_immutable
class Top extends StatelessWidget {
  ChatsController _controller;

  Top(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(generalPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text('enterMobileNumber'.tr
          ,
          style: TextStyle(color: colorGreyLight, fontSize: headLine),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: smallPadding,
        ),
        Text(
          'chatsMessage'.tr,
          style: TextStyle(color: onPrimary, fontSize: h3),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: smallPadding,
        ),
        buildSearchNumberRow(
            onCodeChange: _controller.onCodeChange,
            onTextChanged: _controller.onTextChanged,
        initialCountryCode: _controller.item.countryCode,
        initialDialCode: _controller.item.countryDialCode),
        SizedBox(
          height: smallPadding,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: buttonStyle(),
            child: Text(
              'openInWhatsApp'.tr,
              // style: buttonTextStyle(),
            ),
            onPressed: () {
              // controller.validateForm(_formKey);
              _onSubmitClicked(context);
            },
          ),
        ),
      ]),
    );
  }

  void _onSubmitClicked(BuildContext context) async {
    _controller.validateForm();
  }
}
