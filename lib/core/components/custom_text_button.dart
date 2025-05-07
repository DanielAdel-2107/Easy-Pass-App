import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.title,
    this.style, this.alignment,  this.backgroundColor,
  });
  final Function()? onPressed;
  final String title;
  final TextStyle? style;
  final AlignmentGeometry? alignment;
  final Color ?backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          alignment:alignment?? Alignment.topCenter,
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.03, vertical: 0),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: style ?? AppTextStyles.title18WhiteW500,
          ),
        ),
      ),
    );
  }
}
