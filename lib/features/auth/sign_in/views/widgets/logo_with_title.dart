import 'package:easy_pass/core/utilies/assets/images/app_images.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class LogoWithTitle extends StatelessWidget {
  const LogoWithTitle({
    super.key,
    required this.title, required this.fromBottom,
  });
  final String title;
  final double fromBottom;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.17,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sell_outlined,
                color: Colors.white,
                size: context.screenWidth * 0.1,
              ),
              Image.asset(
                AppImages.logoImage,
                width: context.screenWidth * 0.3,
                height: context.screenWidth * 0.3,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Positioned(
            bottom: fromBottom,
            left: context.screenWidth * 0.06,
            right: 0,
            child: SizedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.title16Grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
