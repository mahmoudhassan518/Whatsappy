import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ActionBarsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ContainersHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/TextFieldsHelper.dart';

class TemplatesDetailsActivity extends StatelessWidget {
  TemplatesHistoryItem item;

  TemplatesDetailsActivity(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backActionBar(
        title: "Edit Template",
      ),
      body: Container(
        padding: EdgeInsets.all(generalPadding),
        child: ListView(children: [
          Text(
            "Message",
            style: TextStyle(
                color: Colors.black, fontSize: h4, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: generalPadding,),

          Container(
            decoration: boxDecoration(shapeColor: colorGrey),
            child: TextFormField(
              minLines: 14,
              maxLines: null,
              style: TextStyle(color: colorPrimary, fontSize: h3),
              keyboardType: TextInputType.multiline,

              decoration:
              inputDecorationWithoutAnimation(),

            ),
          ),

        ],),
      ),
    );
  }
}
