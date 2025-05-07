import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/features/customer/my_requests/views/widgets/my_request_screen_body.dart';
import 'package:flutter/material.dart';

class MyRequestsScreen extends StatelessWidget {
  const MyRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: MyRequestScreenBody(),
    );
  }
}


