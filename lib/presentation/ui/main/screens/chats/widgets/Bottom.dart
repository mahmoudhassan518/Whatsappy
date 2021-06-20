import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';

import '../ChatsController.dart';
import 'ChatsHistoryListItem.dart';

class Bottom extends StatelessWidget {
  ChatsController controller;

  Bottom(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(generalPadding),
      decoration: boxDecoration(
          shapeColor: Colors.white, borderRadius: decorationCards),
      child: Column(
        children: [
          bottomAreaOptions(() => showMyDialog(context,
              onPositiveClicked: () => controller.clearData(),
              title: "Delete recent chats",
              content: "Are you sure you want to delete?")),
          SizedBox(
            height: generalPadding,
          ),
          StreamBuilder<List<ChatsHistory>>(
              stream: controller.watchChatList(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  List<ChatsHistory> data = snapshot.data!;

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: data.length,
                    // <- this is better
                    itemBuilder: (context, index) {
                      print("data changed ${data[index].toJson()}\n");

                      return ChatsHistoryListItem(data[index]);
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
