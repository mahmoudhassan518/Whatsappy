import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';
import 'package:whatsappy/presentation/ui/template_details/TemplateDetailsController.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ActionBarsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/TextFieldsHelper.dart';

// ignore: must_be_immutable
class TemplatesDetailsActivity extends StatelessWidget {
  final TemplateDetailsController controller = Get.find();
  NumberObject item;

  final _messageText = TextEditingController();

  TemplatesDetailsActivity(this.item);

  @override
  Widget build(BuildContext context) {
    controller.setTemplate(item);

    if (!controller.item.isNewTemplate)
      _messageText.text = controller.item.message;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onSubmitClicked,
        child: const Icon(Icons.done),
        backgroundColor: colorPrimary,
      ),
      appBar: backActionBar(
        title: item.isNewTemplate ? 'newTemplate'.tr : 'editTemplate'.tr,
      ),
      body: Container(
        padding: EdgeInsets.all(generalPadding),
        child: Column(
          children: [
            Text(
              'message'.tr,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: h5,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: generalPadding,
            ),
            Expanded(
              child: Container(
                decoration: boxDecoration(shapeColor: colorGrey),
                child: TextFormField(
                  onChanged: controller.onValueChanged,
                  controller: _messageText,
                  minLines: 14,
                  maxLines: null,
                  style: TextStyle(color: colorPrimary, fontSize: h4),
                  keyboardType: TextInputType.multiline,
                  decoration: inputDecorationWithoutAnimation(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmitClicked() {
    controller.validateForm();
  }
}
