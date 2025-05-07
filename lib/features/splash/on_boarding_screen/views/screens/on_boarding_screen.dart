import 'package:easy_pass/features/splash/on_boarding_screen/views/widgets/on_boarding_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:easy_pass/core/utilies/colors/app_colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: OnBoardingScreenBody(),
    );
  }
}





