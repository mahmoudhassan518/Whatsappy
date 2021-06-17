import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';

class NavBarData {
  static List<PersistentBottomNavBarItem> getNavBarList() {
    List<PersistentBottomNavBarItem> _navBarsItems = [];

    _navBarsItems.add(PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.chat_bubble_text_fill),
      title: ("Chats"),
      activeColorPrimary: colorPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ));
    _navBarsItems.add(PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.app_badge_fill),
      title: ("Templates"),
      activeColorPrimary: colorPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ));
    _navBarsItems.add(PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.link),
      title: ("Links"),
      activeColorPrimary: colorPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ));
    _navBarsItems.add(PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.settings),
      title: ("Settings"),
      activeColorPrimary: colorPrimary,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ));
    return _navBarsItems;
  }
}
