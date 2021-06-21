import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SettingsList(
        contentPadding: EdgeInsets.all(generalPadding),
        sections: [
          SettingsSection(
            title: 'Settings',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),


          SettingsSection(
            title: 'Whatsappy',
            tiles: [

              SettingsTile(
                title: 'How to use whatsappy?',
                leading: Icon(Icons.info),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Share whatsappy with friends',
                leading: Icon(Icons.ios_share),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Rate whatsappy',
                leading: Icon(Icons.star),
                onPressed: (BuildContext context) {},
              ),

            ],
          ),


          SettingsSection(
            title: 'Others',
            tiles: [

              SettingsTile(
                title: 'Privacy Policy',
                leading: Icon(Icons.lock),
                onPressed: (BuildContext context) {},
              ),

            ],
          ),
        ],
      ),
    );
  }
}
