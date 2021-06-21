import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/presentation/ui/main/screens/templates/TemplatesController.dart';
import 'package:whatsappy/presentation/ui/main/screens/templates/widgets/TemplatesHistoryListItem.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/others.dart';

class Bottom extends StatelessWidget {
  TemplatesController _controller;

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
              title: "Delete recent templates",
              content: "Are you sure you want to delete?")),
          SizedBox(
            height: generalPadding,
          ),
          StreamBuilder<List<TemplatesHistory>>(
              stream: _controller.watchTemplatesList(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  List<TemplatesHistory> data = snapshot.data!;

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: data.length,
                    // <- this is better
                    itemBuilder: (context, index) {
                      return TemplatesHistoryListItem(data[index], _controller);
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
