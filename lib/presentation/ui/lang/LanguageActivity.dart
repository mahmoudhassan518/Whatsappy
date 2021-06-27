import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/core/BaseActivity.dart';
import 'package:whatsappy/presentation/ui/lang/LanguageController.dart';
import 'package:whatsappy/presentation/ui/lang/widgets/LanguagesListItem.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';
import 'package:whatsappy/presentation/utils/widgets/ActionBarsHelper.dart';
import 'package:whatsappy/presentation/utils/widgets/ButtonsHelper.dart';

class LanguageActivity extends StatelessWidget {
  final LanguageController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseActivity(Scaffold(
      appBar: closeActionBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(generalPadding),
        child: Column(
          children: [
            Text(
              'chooseLanguageTitle'.tr,
              style: TextStyle(color: Colors.black, fontSize: headLine),
            ),
            // SizedBox(height: smallPadding,),
            Text(
              'chooseLanguageMessage'.tr,
              style: TextStyle(color: Colors.grey[500], fontSize: h3),
            ),
            SizedBox(
              height: generalPadding,
            ),

            Obx(() => Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: _controller.languages.length,
                    // <- this is better
                    itemBuilder: (context, index) {
                      // print("data changed ${data[index].toJson()}\n");
                      return LanguagesListItem(
                          _controller.languages[index], _controller);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  ),
                )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style:buttonStyle() ,
                child: Text(
                  'save'.tr,
                  // style: buttonTextStyle(),
                ),
                onPressed:  () => _controller.onDonePress() ,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
