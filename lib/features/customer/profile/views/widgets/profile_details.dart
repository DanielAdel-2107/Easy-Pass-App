import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/auth/sign_in/models/user_model.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
    required this.user,
  });

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: context.screenHeight * 0.05),
        CircleAvatar(
          radius: context.screenWidth * 0.15,
          backgroundColor: Colors.white,
          child: Icon(Icons.person,
              size: context.screenWidth * 0.15,
              color: AppColors.kPrimaryColor),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        Text(user!.name, style: AppTextStyles.title24WhiteW500),
        SizedBox(height: context.screenHeight * 0.01),
        Text(
          user!.email,
          style: AppTextStyles.title18WhiteW500,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: context.screenHeight * 0.02),
        Chip(
          label:
              Text(user!.role, style: AppTextStyles.title18PrimaryColorW500),
          backgroundColor: Colors.white,
          labelStyle: TextStyle(color: AppColors.kPrimaryColor),
          padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.05,
              vertical: context.screenHeight * 0.01),
        ),
      ],
    );
  }
}
