import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.04,
          ),
          child: Text(
            "Or Login With",
            style: AppTextStyles.title18White,
          ),
        ),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
