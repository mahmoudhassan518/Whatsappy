import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappy/data/datasource/locale/MySharedPreferences.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

import 'SplashController.dart';

class SplashActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final SplashController controller = Get.find();

    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 0)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Splash();
        } else {
          // Loading is done, return the app:
          return controller.startValidation();
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Padding(
        padding: EdgeInsets.all(generalPadding),
        child: Center(
          child: Image.asset(
            'assets/images/logo_light.png',
            height: 100,
            width: 100,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
