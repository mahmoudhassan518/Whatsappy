import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:get/get.dart';


class NavBarData {
  static List<PersistentBottomNavBarItem> getNavBarList() {
    List<PersistentBottomNavBarItem> _navBarsItems = [];

    _navBarsItems.add(PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.chat_bubble_text_fill),
      title: ('chats'.tr),
      activeColorPrimary: colorPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ));
    _navBarsItems.add(PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.app_badge_fill),
      title: ('templates'.tr),
      activeColorPrimary: colorPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ));
    _navBarsItems.add(PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.link),
      title: ('links'.tr),
      activeColorPrimary: colorPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ));
    _navBarsItems.add(PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.settings),
      title: ('settings'.tr),
      activeColorPrimary: colorPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ));
    return _navBarsItems;
  }
}
