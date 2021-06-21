import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsappy/presentation/ui/main/screens/links/LinksController.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ButtonsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/TextFieldsHelper.dart';

class Top extends StatelessWidget {
  LinksController _controller;

  final _numberText = TextEditingController();

  Top(this._controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.all(generalPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              "Enter Mobile Number",
              style: TextStyle(color: colorGreyLight, fontSize: headLine),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: smallPadding,
            ),
            Text(
              "To create Whatsapp URL you can share with others to contact you",
              style: TextStyle(color: onPrimary, fontSize: h3),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: smallPadding,
            ),
            Row(
              children: [
                Container(
                  height: 48,
                  decoration: boxDecoration(shapeColor: colorPrimaryDark),
                  child: CountryCodePicker(
                    onChanged: _onCodeChange,

                    textStyle: TextStyle(color: onPrimary, fontSize: h3),
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'EG',
                    favorite: ['+20', 'EG'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                ),
                SizedBox(
                  width: smallPadding,
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: boxDecoration(shapeColor: colorPrimaryDark),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: _numberText,
                      // autofocus: true,
                      style: TextStyle(color: onPrimary, fontSize: h3),
                      maxLines: 1,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(15),
                      ],
                      textInputAction: TextInputAction.send,
                      onSubmitted: (value) {
                        _onSubmitClicked();
                      },
                      decoration: inputDecorationWithoutAnimation(
                        label: "",
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                  'Generate WhatsApp Link',
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
    return  controller.number .isNotEmpty ?  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    _controller.shareLink(controller.number.value);
                  },
                  child: Text(
                    'Share Link',
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
                    'Copy Link',
                    style: TextStyle(color: onPrimary, fontSize: h3),
                  ))
            ],
          ): SizedBox.shrink();
  }

  SizedBox checkLinkVisibility(LinksController controller) {
    return controller.number .isNotEmpty ? SizedBox(
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
          ) : SizedBox.shrink();
  }

  void _onCodeChange(CountryCode value) {
    print(value.name);
  }

  _onSubmitClicked() async {
    _controller.validateForm(_numberText.value.text);
  }
}
