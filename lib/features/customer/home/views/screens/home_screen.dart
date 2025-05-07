import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/features/customer/home/views/widgets/customer_fab_circular_plus.dart';
import 'package:easy_pass/features/customer/home/views/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: const HomeScreenBody(),
      floatingActionButton: CustomerFabCircularMenuPlus(), //
    );
  }
}
