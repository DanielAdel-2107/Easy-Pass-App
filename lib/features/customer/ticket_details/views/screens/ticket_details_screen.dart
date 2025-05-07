
import 'dart:developer';

import 'package:easy_pass/core/cache/cache_helper.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/customer/ticket_details/views/widgets/ticket_details_screen_body.dart';
import 'package:flutter/material.dart';

class TicketDetailsScreen extends StatelessWidget {
  const TicketDetailsScreen({super.key});

  @override

  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final ticketModel = TicketModel.fromJson(args);
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: TicketDetailsBody(ticket: ticketModel),
    );
  }
}





