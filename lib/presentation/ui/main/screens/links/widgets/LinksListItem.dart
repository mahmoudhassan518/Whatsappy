import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/presentation/ui/main/screens/links/LinksController.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

// ignore: must_be_immutable
class LinksListItem extends StatelessWidget {
  NumberObject item;

  LinksController controller;

  LinksListItem(this.item, this.controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.shareLink('https://wa.me/' + item.number),
      child: Row(
        children: [
          CountryPickerUtils.getDefaultFlagImage(Country(
              isoCode: item.isoCode,
              name: '',
              iso3Code: '',
              phoneCode: '')),

          SizedBox(
            width: generalPadding,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.number}",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: h4,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "${item.dateTime}",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: h2,
                    color: CupertinoColors.systemGrey,
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.ios_share,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
