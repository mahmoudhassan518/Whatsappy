
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:whatsappy/domain/models/NavBarData.dart';
import 'package:whatsappy/presentation/ui/main/screens/chats/ChatsScreen.dart';
import 'package:whatsappy/presentation/ui/main/screens/LinksScreen.dart';
import 'package:whatsappy/presentation/ui/main/screens/SettingsScreen.dart';
import 'package:whatsappy/presentation/ui/main/screens/TemplatesScreen.dart';
import 'package:whatsappy/presentation/utils/widgets/ActionBarsHelper.dart';

class MainActivity extends StatelessWidget {
  late PersistentTabController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
        // resizeToAvoidBottomInset:  true,
        appBar: titleActionBar(title: "Whatsappy", actions: [
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'share app',
            onPressed: () {

            },
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



}


