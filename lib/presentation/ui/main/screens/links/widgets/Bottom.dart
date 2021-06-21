import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';
import 'package:whatsappy/presentation/ui/main/screens/links/LinksController.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';

import 'LinksListItem.dart';

class Bottom extends StatelessWidget {
  LinksController _controller;

  Bottom(this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(generalPadding),
      decoration: boxDecoration(
          shapeColor: Colors.white, borderRadius: decorationCards),
      child: Column(
        children: [
          bottomAreaOptions(() => showMyDialog(context,
              onPositiveClicked: () => _controller.clearData(),
              title: "Delete recent links",
              content: "Are you sure you want to delete?")),
          SizedBox(
            height: generalPadding,
          ),
          StreamBuilder<List<LinksHistory>>(
              stream: _controller.watchLinkList(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  List<LinksHistory> data = snapshot.data!;

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: data.length,
                    // <- this is better
                    itemBuilder: (context, index) {
                      // print("data changed ${data[index].toJson()}\n");

                      return LinksListItem(data[index], _controller);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  );
                } else
                  return Text("Loading...");
              }),
        ],
      ),
    );
  }
}
