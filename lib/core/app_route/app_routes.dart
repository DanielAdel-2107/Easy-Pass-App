import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/features/auth/sign_in/views/screens/sign_in_screen.dart';
import 'package:easy_pass/features/auth/sign_up/views/screens/sign_up_screen.dart';
import 'package:easy_pass/features/chat/views/screens/chat_screen.dart';
import 'package:easy_pass/features/customer/home/views/screens/home_screen.dart';
import 'package:easy_pass/features/customer/my_requests/views/screens/my_requests_screen.dart';
import 'package:easy_pass/features/customer/payment/views/screens/payment_screen.dart';
import 'package:easy_pass/features/customer/profile/views/screens/profile_screen.dart';
import 'package:easy_pass/features/customer/select_category/views/screens/select_category_screen.dart';
import 'package:easy_pass/features/customer/ticket_details/views/screens/ticket_details_screen.dart';
import 'package:easy_pass/features/owner/add_ticket/views/screens/add_ticket_screen.dart';
import 'package:easy_pass/features/owner/my_ticket/views/screens/my_tickets_screen.dart';
import 'package:easy_pass/features/owner/show_owner_request/views/screens/show_owner_request_screen.dart';
import 'package:easy_pass/features/splash/on_boarding_screen/views/screens/on_boarding_screen.dart';
import 'package:easy_pass/features/splash/splash_screen/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.signInScreen: (context) => const SignInScreen(),
    RouteNames.signUpScreen: (context) => const SignUpScreen(),
    RouteNames.addTicketScreen: (context) => const AddTicketScreen(),
    RouteNames.homeScreen: (context) => const HomeScreen(),
    RouteNames.ticketDetailsScreen: (context) => const TicketDetailsScreen(),
    RouteNames.chatScreen: (context) => const ChatScreen(),
    RouteNames.myRequestsScreen: (context) => const MyRequestsScreen(),
    RouteNames.showOwnerRequestScreen: (context) =>
        const ShowOwnerRequestScreen(),
    RouteNames.paymentScreen: (context) => const PaymentScreen(),
    RouteNames.selectCategoryScreen: (context) => const SelectCategoryScreen(),
    RouteNames.profileScreen: (context) => const ProfileScreen(),
    RouteNames.myTicketsScreen: (context) => const MyTicketsScreen(),
  };
}
