import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.screenWidth * 0.04,
          right: context.screenWidth * 0.04,
          top: context.screenHeight * 0.01),
      child: Divider(
        color: Colors.grey.shade400,
      ),
    );
  }
}
