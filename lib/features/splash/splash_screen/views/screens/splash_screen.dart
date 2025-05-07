import 'dart:developer';

import 'package:easy_pass/core/cache/cache_helper.dart';
import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/splash/splash_screen/views/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToOnBoardingScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SplashScreenBody(),
    );
  }

void navigateToOnBoardingScreen() {
  Future.delayed(const Duration(seconds: 5), () {
    final user = getIt<CacheHelper>().getUserModel();
    log("User Role: ${user?.role}");

    if (user?.role == "Customer") {
      context.pushReplacementScreen(RouteNames.homeScreen);
    } else if (user?.role == "Brand Or Owner") {
      context.pushReplacementScreen(RouteNames.addTicketScreen);
    } else {
      context.pushReplacementScreen(RouteNames.onBoardingScreen);
    }
  });
}
}
