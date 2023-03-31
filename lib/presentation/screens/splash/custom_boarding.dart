import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/core/utils/common.dart';
import 'package:inventory_tracker/domain/controllers/auth_controller.dart';

class CustomBoarding extends StatelessWidget {
  const CustomBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber.shade200,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
            tileMode: TileMode.repeated,
            transform: const GradientRotation(pi / 4),
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: widthQuery(context, 16),
                  top: heightQuery(context, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Gengo",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        "Stock",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.red[700]),
                      ),
                    ],
                  ),
                ),
                Positioned(bottom: 0, child: Image.asset("assets/chart.png"))
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Best Stock Management App",
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                    onPressed: () async {
                      await AuthController.c.forgetUser();
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: const Text("Get Started"))
              ],
            )),
          ],
        ),
      ),
    ));
  }
}
