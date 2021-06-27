import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/presentation/ui/main/screens/links/LinksController.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ButtonsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';


// ignore: must_be_immutable
class Top extends StatelessWidget {
  LinksController _controller;

  Top(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () => Container(
      padding: EdgeInsets.all(generalPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          'enterMobileNumber'.tr,
          style: TextStyle(color: colorGreyLight, fontSize: headLine),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: smallPadding,
        ),
        Text(
          'linksMessage'.tr,
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
        checkLinkVisibility(_controller),
        SizedBox(
          height: smallPadding,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: buttonStyle(),
            child: Text(
              'generateWhatsAppLink'.tr,
              style: TextStyle(color: onPrimary, fontSize: h3),
            ),
            onPressed: () {
              _onSubmitClicked();
            },
          ),
        ),
        SizedBox(
          height: smallPadding,
        ),
        checkLinkOptions(_controller),
      ]),
    ));
  }

  Widget checkLinkOptions(LinksController controller) {
    return controller.number.isNotEmpty
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    _controller.shareLink(controller.number.value);
                  },
                  child: Text(
                    'shareLink'.tr,
                    style: TextStyle(color: onPrimary, fontSize: h3),
                  )),
              SizedBox(
                width: smallPadding,
              ),
              TextButton(
                  onPressed: () {
                    _controller.copySharedLink();
                  },
                  child: Text(
                    'copyLink'.tr,
                    style: TextStyle(color: onPrimary, fontSize: h3),
                  ))
            ],
          )
        : SizedBox.shrink();
  }

  SizedBox checkLinkVisibility(LinksController controller) {
    return controller.number.isNotEmpty
        ? SizedBox(
            width: double.infinity,
            child: Container(
              decoration: boxDecoration(shapeColor: colorPrimaryDark),
              padding: EdgeInsets.all(generalPadding),
              child: Text(
                controller.number.value,
                style: TextStyle(color: onPrimary, fontSize: h3),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : SizedBox.shrink();
  }

  _onSubmitClicked() async {
    _controller.validateForm();
  }
}
