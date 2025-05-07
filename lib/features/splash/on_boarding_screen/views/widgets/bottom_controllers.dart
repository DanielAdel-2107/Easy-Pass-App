import 'package:easy_pass/core/components/custom_elevated_button.dart';
import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomControls extends StatelessWidget {
  final PageController controller;
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNext;

  const BottomControls({
    required this.controller,
    required this.currentIndex,
    required this.totalPages,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(

        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: totalPages,
              effect:  ExpandingDotsEffect(
                activeDotColor: AppColors.kPrimaryColor,
              ),
            ),
            CustomElevatedButton(
              name: currentIndex == totalPages - 1 ? "Finish" : "Next",
              textStyle: AppTextStyles.title18WhiteW500,
              backgroundColor: AppColors.kPrimaryColor,
              width: context.screenWidth * 0.2,
              height: context.screenHeight * 0.05,
              onPressed: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
