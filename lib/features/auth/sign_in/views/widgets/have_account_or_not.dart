import 'package:easy_pass/core/components/custom_text_button.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({
    super.key,
    required this.title,
    required this.btnText,
    required this.onPressed,
  });
  final String title, btnText;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.title20WhiteW500,
        ),
        SizedBox(
          width: context.screenWidth * 0.02,
        ),
        CustomTextButton(
          title: btnText,
          alignment: Alignment.center,
          onPressed: onPressed,
          backgroundColor: Colors.black45,
        ),
      ],
    );
  }
}
