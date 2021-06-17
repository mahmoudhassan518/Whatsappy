import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/presentation/utils/navigation/NavigationHelper.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';

class TemplatesScreen extends StatelessWidget {
  const TemplatesScreen({Key? key}) : super(key: key);

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
          "Templates",
          style: TextStyle(color: colorGreyLight, fontSize: headLine),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: smallPadding,
        ),
        Text(
          "Create messages which you send frequently on whatsapp, add more by clicking on ADD",
          style: TextStyle(color: onPrimary, fontSize: h3),
          textAlign: TextAlign.center,
        ),
      ]),
    );
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
          bottomAreaOptions((){}),
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

  final List<TemplatesHistoryItem> items = [
    TemplatesHistoryItem(),
    TemplatesHistoryItem(),
    TemplatesHistoryItem(),
    TemplatesHistoryItem(),
    TemplatesHistoryItem(),
    TemplatesHistoryItem(),
    TemplatesHistoryItem(),
    TemplatesHistoryItem(),
  ];
}

class HistoryListItem extends StatelessWidget {
  TemplatesHistoryItem item;

  HistoryListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: (){startTemplatesDetails(item);},
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
        SizedBox(width: generalPadding,),
        Icon(
          Icons.message,
          color: colorPrimary,
        ),
      ],
    );
  }
}


