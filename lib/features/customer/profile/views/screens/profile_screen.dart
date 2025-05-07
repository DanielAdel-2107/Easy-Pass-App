import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/features/customer/profile/views/widgets/profile_screen_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: ProfileScreenBody(),
    );
  }
}


