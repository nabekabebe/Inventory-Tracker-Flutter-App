import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAnimationContainer extends StatelessWidget {
  const RiveAnimationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0x00313131),
      child: const Center(
        child: RiveAnimation.asset(
          "assets/bg_wave.riv",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
