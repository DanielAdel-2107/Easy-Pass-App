import 'package:easy_pass/core/utilies/assets/images/app_images.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/social_icon_button.dart';
import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.04,
        vertical: context.screenHeight * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SocialIconButton(
            image: AppImages.facebookImage,
            onTap: () {},
            width: context.screenWidth * 0.15,
          ),
          SocialIconButton(
            image: AppImages.googleImage,
            onTap: () {},
            width: context.screenWidth * 0.115,
          ),
        ],
      ),
    );
  }
}
