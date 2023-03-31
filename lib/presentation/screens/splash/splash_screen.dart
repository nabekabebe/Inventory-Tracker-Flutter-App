// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/domain/controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (AuthController.c.isLoggedIn()) {
        Get.toNamed(Routes.HOME);
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Image(
                image: AssetImage("assets/icons/inventory_launcher.png"),
                width: 100,
                height: 100),
            // Image.asset("assets/icons/inventory_launcher.png",
            //     width: 100, height: 100),
            SizedBox(height: 25),
            SpinKitDoubleBounce(
              color: Colors.blue,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
