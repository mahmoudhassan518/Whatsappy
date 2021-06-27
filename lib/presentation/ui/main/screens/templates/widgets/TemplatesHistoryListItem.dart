import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/presentation/ui/main/screens/templates/TemplatesController.dart';
import 'package:whatsappy/presentation/utils/navigation/NavigationHelper.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

// ignore: must_be_immutable
class TemplatesHistoryListItem extends StatelessWidget {
  NumberObject item;
  TemplatesController controller;

  TemplatesHistoryListItem(this.item, this.controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              startTemplatesDetails(item);
            },
            child: Text(
              "${item.message}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: h4,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        SizedBox(
          width: generalPadding,
        ),
        InkWell(
          onTap: () {
            controller.launchWhatsApp(item);
          },
          child: Icon(
            Icons.message,
            color: colorPrimary,
          ),
        ),
      ],
    );
  }
}
