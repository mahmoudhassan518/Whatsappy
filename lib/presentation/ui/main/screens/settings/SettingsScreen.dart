import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:whatsappy/presentation/ui/main/screens/settings/SettingsController.dart';
import 'package:whatsappy/presentation/utils/navigation/NavigationHelper.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {


    WidgetsBinding.instance!.addPostFrameCallback((_){
      _controller.updateLanguage();
    });

    return Obx(() => Container(
          child: SettingsList(
            contentPadding: EdgeInsets.all(generalPadding),
            sections: [
              SettingsSection(
                title: 'settings'.tr,
                tiles: [
                  SettingsTile(
                    title: 'language'.tr,
                    subtitle: _controller.language.value,
                    leading: Icon(Icons.language),
                    onPressed: (BuildContext context) =>
                        startLanguageActivity(),
                  ),
                ],
              ),
              SettingsSection(
                title: 'appName'.tr,
                tiles: [
                  SettingsTile(
                    title: 'howToUseApp'.tr,
                    leading: Icon(Icons.info),
                    onPressed: (BuildContext context) {},
                  ),
                  // SettingsTile(
                  //   title: 'shareWithFriends'.tr,
                  //   leading: Icon(Icons.share),
                  //   onPressed: (BuildContext context) {},
                  // ),
                  SettingsTile(
                    title: 'rateApp'.tr,
                    leading: Icon(Icons.star),
                    onPressed: (BuildContext context) {},
                  ),
                ],
              ),
              SettingsSection(
                title: 'others'.tr,
                tiles: [
                  SettingsTile(
                    title: 'privacyPolicy'.tr,
                    leading: Icon(Icons.lock),
                    onPressed: (BuildContext context) {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }

}
