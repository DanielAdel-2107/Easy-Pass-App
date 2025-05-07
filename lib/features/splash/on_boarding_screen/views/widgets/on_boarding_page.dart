import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/splash/on_boarding_screen/models/on_boarding_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingData data;

  const OnBoardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(data.image, height: context.screenHeight * 0.45),
        SizedBox(height: context.screenHeight * 0.05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
          child: Column(
            children: [
              Text(
                data.title,
                style: AppTextStyles.title36PrimaryColorBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.screenHeight * 0.02),
              Text(
                data.description,
                style: AppTextStyles.title20Black54,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
