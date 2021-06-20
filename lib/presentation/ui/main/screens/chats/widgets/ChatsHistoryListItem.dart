import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

class ChatsHistoryListItem extends StatelessWidget {
  ChatsHistory item;

  ChatsHistoryListItem(this.item);

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
