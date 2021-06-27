import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:share/share.dart';
import 'package:whatsappy/domain/models/NavBarData.dart';
import 'package:whatsappy/presentation/ui/main/screens/chats/ChatsScreen.dart';
import 'package:whatsappy/presentation/ui/main/screens/links/LinksScreen.dart';
import 'package:whatsappy/presentation/ui/main/screens/settings/SettingsScreen.dart';
import 'package:whatsappy/presentation/ui/main/screens/templates/TemplatesScreen.dart';
import 'package:whatsappy/presentation/utils/widgets/ActionBarsHelper.dart';
import 'package:get/get.dart';



// ignore: must_be_immutable
class MainActivity extends StatelessWidget {
  late PersistentTabController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
        // resizeToAvoidBottomInset:  true,
        appBar: titleActionBar(title: 'appName'.tr, actions: [
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'shareApp'.tr,
            onPressed: () { _shareLink('shareAppMessage'.tr);},
          ),
        ]),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: NavBarData.getNavBarList(),
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          // Default is Colors.white.
          handleAndroidBackButtonPress: true,
          // Default is true.
          resizeToAvoidBottomInset: true,
          // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true,
          // Default is true.
          hideNavigationBarWhenKeyboardShows: true,
          // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style1, // Choose the nav bar style with this property.
        ));
  }

  List<Widget> _buildScreens() {
    return [ChatsScreen(), TemplatesScreen(), LinksScreen(), SettingsScreen()];
  }

  _shareLink(String msg) async {
    await Share.share(msg);
  }
}
