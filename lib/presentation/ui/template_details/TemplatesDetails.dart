import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/presentation/ui/template_details/TemplateDetailsController.dart';
import 'package:whatsappy/presentation/utils/helper/helper.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ActionBarsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/TextFieldsHelper.dart';

class TemplatesDetailsActivity extends StatelessWidget {
  final TemplateDetailsController controller = Get.find();
  TemplatesHistory item;

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
        title: item.isNewTemplate ? "New Template" : "Edit Template",
      ),
      body: Container(
        padding: EdgeInsets.all(generalPadding),
        child: ListView(
          children: [
            Text(
              "Message",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: h4,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: generalPadding,
            ),
            Container(
              decoration: boxDecoration(shapeColor: colorGrey),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Message Required!';
                  }
                  return null;
                },
                controller: _messageText,
                minLines: 14,
                maxLines: null,
                style: TextStyle(color: colorPrimary, fontSize: h3),
                keyboardType: TextInputType.multiline,
                decoration: inputDecorationWithoutAnimation(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmitClicked() {
    if (_messageText.value.text.isEmpty) {
      showSnackBar(title: "Error", content: "Required");
      return;
    }

    controller.validateForm(_messageText.value.text);
  }
}
