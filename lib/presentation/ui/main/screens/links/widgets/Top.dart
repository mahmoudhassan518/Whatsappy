import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/presentation/ui/main/screens/links/LinksController.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ButtonsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';

// ignore: must_be_immutable
class Top extends StatefulWidget {
  LinksController _controller;

  Top(this._controller);

  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  final _textController = TextEditingController();

  @override
  void initState() {
    widget._controller.initCountryCodes();
    widget._controller.setTextEditingController(_textController);

    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _textController = TextEditingController(text: widget._controller.codes[phoneTxt].toString());

    return Container(
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
        Obx(() => InkWell(
              onTap: () {
                openCountryPickerDialog(
                    context: context,
                    onValuePicked: (Country country) {
                      widget._controller.setCountry(country:  country);
                    });
              },
              child: buildSearchNumberRow(
                  onTextChanged: widget._controller.onTextChanged,
                  controller: _textController,
                  country: widget._controller.country.value),
            )),
        SizedBox(
          height: smallPadding,
        ),
        Obx(() => checkLinkVisibility(widget._controller)),
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
              _onSubmitClicked(widget._controller);
            },
          ),
        ),
        SizedBox(
          height: smallPadding,
        ),
        Obx(() => checkLinkOptions(widget._controller)),
      ]),
    );
  }

  Widget checkLinkOptions(LinksController controller) {
    return controller.generatedLink.value.isNotEmpty
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    widget._controller
                        .shareLink(controller.generatedLink.value);
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
                    widget._controller.copySharedLink();
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
    return controller.generatedLink.value.isNotEmpty
        ? SizedBox(
            width: double.infinity,
            child: Container(
              decoration: boxDecoration(shapeColor: colorPrimaryDark),
              padding: EdgeInsets.all(generalPadding),
              child: Text(
                controller.generatedLink.value,
                style: TextStyle(color: onPrimary, fontSize: h3),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : SizedBox.shrink();
  }

  _onSubmitClicked(LinksController controller) async {
    controller.validateForm();
  }
}
