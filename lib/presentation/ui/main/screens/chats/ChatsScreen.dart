import 'package:circle_flags/circle_flags.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsappy/core/BaseActivity.dart';
import 'package:whatsappy/domain/models/ChatsHistoryItem.dart';
import 'package:whatsappy/presentation/ui/main/screens/chats/ChatsController.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ButtonsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/TextFieldsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatsController controller = Get.find();

    return BaseActivity(
      Container(
        color: colorPrimary,
        child: Column(
          children: [
            _Top(controller),
            Expanded(
              child: _Bottom(controller),
            ),
          ],
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _numberText = TextEditingController();

  ChatsController controller;

  _Top(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(generalPadding),
      child: Form(
        key: _formKey,
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
                  child: TextFormField(
                    controller: _numberText,
                    style: TextStyle(color: onPrimary, fontSize: h3),
                    maxLines: 1,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(15),
                    ],
                    validator: (value) => null,
                    decoration: inputDecorationWithoutAnimation(label: ""),
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
                controller.test();
              },
            ),
          ),
        ]),
      ),
    );
  }

  void _onCodeChange(CountryCode value) {
    print(value.name);
  }
}

class _Bottom extends StatelessWidget {
  ChatsController controller;

  _Bottom(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(generalPadding),
      decoration: boxDecoration(
          shapeColor: Colors.white, borderRadius: decorationCards),
      child: Column(
        children: [
          bottomAreaOptions(() {}),
          SizedBox(
            height: generalPadding,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return HistoryListItem(items[index]);
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  }

  final List<ChatsHistoryItem> items = [
    ChatsHistoryItem(),
    ChatsHistoryItem(),
    ChatsHistoryItem(),
    ChatsHistoryItem(),
    ChatsHistoryItem(),
    ChatsHistoryItem(),
    ChatsHistoryItem(),
    ChatsHistoryItem(),
  ];
}

class HistoryListItem extends StatelessWidget {
  ChatsHistoryItem item;

  HistoryListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleFlag(
          item.countryCode,
          size: 32,
        ),
        SizedBox(
          width: generalPadding,
        ),
        Column(
          children: [
            Text(
              "${item.fullNumber}",
              style: TextStyle(
                  fontSize: h4,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              "${item.dateTime}",
              style: TextStyle(
                fontSize: h2,
                color: CupertinoColors.systemGrey,
              ),
            )
          ],
        ),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.black,
                ))),
      ],
    );
  }
}
