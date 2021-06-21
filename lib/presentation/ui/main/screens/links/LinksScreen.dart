import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/domain/models/ChatsHistory.dart';
import 'package:whatsappy/domain/models/LinksHistory.dart';
import 'package:whatsappy/presentation/ui/main/screens/links/widgets/Bottom.dart';
import 'package:whatsappy/presentation/ui/main/screens/links/widgets/Top.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

import 'LinksController.dart';

class LinksScreen extends StatelessWidget {

  final LinksController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: ListView(
        shrinkWrap: false,
        children: [
          Top(controller),
          Bottom(controller),
        ],
      ),
    );
  }
}

