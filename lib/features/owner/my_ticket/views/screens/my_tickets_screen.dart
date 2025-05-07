import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/features/owner/my_ticket/views/widgets/my_tickets_screen_body.dart';
import 'package:flutter/material.dart';

class MyTicketsScreen extends StatelessWidget {
  const MyTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: MyTicketsScreenBody(),
    );
  }
}



