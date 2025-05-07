import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    this.onTap,
    required this.image,
    this.width,
  });
  final Function()? onTap;
  final String image;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.01,
          vertical: context.screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: Image.asset(
          image,
          width: width,
        ),
      ),
    );
  }
}
