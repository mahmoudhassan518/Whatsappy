import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/presentation/ui/main/screens/chats/ChatsController.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ButtonsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';

// ignore: must_be_immutable

class Top extends StatefulWidget {
  ChatsController _controller;

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
          'chatsMessage'.tr,
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
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: buttonStyle(),
            child: Text(
              'openInWhatsApp'.tr,
              // style: buttonTextStyle(),
            ),
            onPressed: () {
              _onSubmitClicked(widget._controller);
            },
          ),
        ),
      ]),
    );
  }

  void _onSubmitClicked(ChatsController controller) async {
    controller.validateForm();
  }
}
