import 'package:easy_pass/core/components/custom_icon_button.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({
    super.key,
    required this.title,
    this.onPressed,
    this.time,
  });
  final String title;
  final String? time;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppTextStyles.title20WhiteW500,
            ),
            CustomIconButton(
              icon: Icons.timer_outlined,
              onPressed: onPressed,
            )
          ],
        ),
        time != null
            ? Text(
                time!,
                style: AppTextStyles.title18WhiteW500,
              )
            : SizedBox(),
      ],
    );
  }
}
