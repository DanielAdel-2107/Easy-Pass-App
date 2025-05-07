import 'dart:developer';
import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/customer/select_category/views/widgets/select_ticket_screen_body.dart';
import 'package:flutter/material.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as List<Map<String, dynamic>>;
    final tickets = args.map((e) => TicketModel.fromJson(e)).toList();
    log(tickets.toString());
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SelectCategoryScreenBody(tickets: tickets),
    );
  }
}

