import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.15,
      width: context.screenWidth,
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.title28PrimaryColorW500,
        ),
      ),
    );
  }
}
