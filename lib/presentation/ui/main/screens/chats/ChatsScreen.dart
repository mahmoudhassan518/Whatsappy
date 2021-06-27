import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/core/BaseActivity.dart';
import 'package:whatsappy/presentation/ui/main/screens/chats/ChatsController.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';

import 'widgets/Bottom.dart';
import 'widgets/Top.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatsController controller = Get.find();

    return BaseActivity(
      Container(
        color: colorPrimary,
        child: ListView(
          shrinkWrap: false,
          children: [
            Top(controller),
            Bottom(controller),
          ],
        ),
      ),
    );
  }
}
