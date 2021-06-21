import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/presentation/ui/main/screens/templates/widgets/Bottom.dart';
import 'package:whatsappy/presentation/ui/main/screens/templates/widgets/top.dart';
import 'package:whatsappy/presentation/utils/navigation/NavigationHelper.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';

import 'TemplatesController.dart';

class TemplatesScreen extends StatelessWidget {
  final TemplatesController controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () {
          startTemplatesDetails(TemplatesHistory());
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
        backgroundColor: colorPrimary,
      ),
      body: Container(
        color: colorPrimary,
        child: Column(
          children: [
            Top(controller),
            Expanded(
              child: Bottom(controller),
            ),
          ],
        ),
      ),
    );
  }
}
