import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/presentation/ui/main/screens/chats/ChatsController.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';
import 'package:get/get.dart';


import 'ChatsHistoryListItem.dart';

// ignore: must_be_immutable
class Bottom extends StatelessWidget {
  ChatsController _controller;

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
              title: 'deleteChatsTitle'.tr,
              content: 'deleteChatsContent'.tr)),
          SizedBox(
            height: generalPadding,
          ),
          StreamBuilder<List<NumberObject>>(
              stream: _controller.watchChatList(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  List<NumberObject> data = snapshot.data!;

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: data.length,
                    // <- this is better
                    itemBuilder: (context, index) {
                      // print("data changed ${data[index].toJson()}\n");

                      return ChatsHistoryListItem(data[index], _controller);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  );
                } else
                  return Text('loading'.tr);
              }),
        ],
      ),
    );
  }
}
