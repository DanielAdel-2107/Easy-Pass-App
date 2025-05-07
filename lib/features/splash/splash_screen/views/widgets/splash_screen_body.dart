import 'package:easy_pass/core/utilies/assets/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(AppImages.logoImage)
          .animate(
            delay: Duration(milliseconds: 500),
          )
          .scale(
            duration: Duration(milliseconds: 1500),
            curve: Curves.slowMiddle,
          ),
    );
  }
}
