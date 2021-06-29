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
class TemplatesDetailsActivity extends StatefulWidget {
  final TemplateDetailsController _controller = Get.find();
  late NumberObject item;

  TemplatesDetailsActivity(this.item);

  @override
  _TemplatesDetailsActivityState createState() =>
      _TemplatesDetailsActivityState();
}

class _TemplatesDetailsActivityState extends State<TemplatesDetailsActivity> {
  final _textController = TextEditingController();

  @override
  void initState() {
    widget._controller.setTemplate(widget.item);
    if (!widget._controller.item.isNewTemplate)
      _textController.text = widget._controller.item.message;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onSubmitClicked,
        child: const Icon(Icons.done),
        backgroundColor: colorPrimary,
      ),
      appBar: backActionBar(
        title: widget.item.isNewTemplate ? 'newTemplate'.tr : 'editTemplate'.tr,
      ),
      body: Container(
        padding: EdgeInsets.all(generalPadding),
        child: Column(
          children: [
            Text(
              'message'.tr,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: h6,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: generalPadding,
            ),
            Expanded(
              child: Container(
                decoration: boxDecoration(shapeColor: colorGrey),
                child: TextFormField(
                  onChanged: widget._controller.onValueChanged,
                  controller: _textController,
                  minLines: 14,
                  maxLines: null,
                  style: TextStyle(color: colorPrimary, fontSize: h5),
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
    widget._controller.validateForm();
  }
}
