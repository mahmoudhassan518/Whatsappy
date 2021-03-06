import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/presentation/ui/main/screens/chats/ChatsController.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';


// ignore: must_be_immutable
class ChatsHistoryListItem extends StatelessWidget {
  NumberObject item;
  ChatsController _controller;

  ChatsHistoryListItem(this.item, this._controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onItemClicked.call(item, _controller),
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
                Icons.arrow_forward_outlined,
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  _onItemClicked(NumberObject data, ChatsController _controller) async {
    await _controller.launchWhatsAppOnly(data);
  }
}
