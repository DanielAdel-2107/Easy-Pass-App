// ignore_for_file: deprecated_member_use
import 'package:device_preview/device_preview.dart';
import 'package:easy_pass/core/app_route/app_routes.dart';
import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/features/customer/profile/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      useInheritedMediaQuery: true,
      routes: AppRoutes.routes,
      initialRoute: RouteNames.splashScreen,
    );
  }
}
