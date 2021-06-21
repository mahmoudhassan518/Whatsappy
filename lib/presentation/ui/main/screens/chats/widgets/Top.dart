import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ButtonsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/TextFieldsHelper.dart';

import '../ChatsController.dart';

class Top extends StatelessWidget {
  final _numberText = TextEditingController();

  ChatsController controller;
  FocusNode _phoneFocusNode = new FocusNode();

  Top(this.controller);

  @override
  Widget build(BuildContext context) {


    _phoneFocusNode.addListener(() { print(_phoneFocusNode.hasFocus); });

    return Container(
      padding: EdgeInsets.all(generalPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          "Enter Mobile Number",
          style: TextStyle(color: colorGreyLight, fontSize: headLine),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: smallPadding,
        ),
        Text(
          "To start a WhatsApp conversation without saving the number to contacts",
          style: TextStyle(color: onPrimary, fontSize: h3),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: smallPadding,
        ),
        Row(
          children: [
            Container(
              decoration: boxDecoration(shapeColor: colorPrimaryDark),
              child: CountryCodePicker(
                onChanged: controller.onCodeChange,

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
                decoration: boxDecoration(shapeColor: colorPrimaryDark),
                child: GestureDetector(
                  onTap: () {
                    _phoneFocusNode.requestFocus();
                  },
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _numberText,
                    focusNode: _phoneFocusNode,
                    // autofocus: true,
                    style: TextStyle(color: onPrimary, fontSize: h3),
                    maxLines: 1,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
                    ],
                    textInputAction: TextInputAction.send,
                    onSubmitted: (value) {
                      _onSubmitClicked(context);
                    },
                    decoration: inputDecorationWithoutAnimation(
                      label: "",
                      suffixIcon: _phoneFocusNode.hasFocus
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _numberText.clear();
                              })
                          // use a SizedBox widget instead
                          : SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: smallPadding,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: buttonStyle(),
            child: Text(
              'Open in WhatsApp',
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

  void _onSubmitClicked(BuildContext context) async{
    controller.validateForm(_numberText.value.text);

  }
}
