import 'package:circle_flags/circle_flags.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ButtonsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/TextFieldsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: Column(
        children: [
          _Top(),
          Expanded(
            child: _Bottom(),
          ),
        ],
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: TextFormField(
                  style: TextStyle(color: onPrimary, fontSize: h3),
                  maxLines: 1,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                  ],
                  decoration:
                      inputDecorationWithoutAnimation(label: "109355634"),
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
          child: Container(
            decoration: boxDecoration(shapeColor: colorPrimaryDark),
            padding: EdgeInsets.all(generalPadding),
            child: Text(
              'https://wa.me/20109355634',
              style: TextStyle(color: onPrimary, fontSize: h3),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: smallPadding,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: buttonStyle(),
            child: Text(
              'Generate WhatsApp Link',
              // style: buttonTextStyle(),
            ),
            onPressed: () {},
          ),
        ),
      ]),
    );
  }

  void _onCodeChange(CountryCode value) {
    print(value.name);
  }
}

class _Bottom extends StatelessWidget {
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

  final List<ChatsHistory> items = [];
}

class HistoryListItem extends StatelessWidget {
  ChatsHistory item;

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
                  Icons.ios_share,
                  color: Colors.black,
                ))),
      ],
    );
  }
}
