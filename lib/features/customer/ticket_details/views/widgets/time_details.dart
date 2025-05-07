import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class TimeDetails extends StatelessWidget {
  const TimeDetails({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.title20WhiteW500),
        Text(value, style: AppTextStyles.title20WhiteW500),
      ],
    );
  }
}
