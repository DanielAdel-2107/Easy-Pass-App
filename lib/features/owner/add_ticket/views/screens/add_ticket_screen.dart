import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/features/owner/add_ticket/views/widgets/add_ticket_screen_body.dart';
import 'package:easy_pass/features/owner/add_ticket/views/widgets/owner_fab_circular_plus.dart';
import 'package:flutter/material.dart';

class AddTicketScreen extends StatelessWidget {
  const AddTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: AddTicketScreenBody(),
      floatingActionButton: OwnerFabCircularMenuPlus(),
    );
  }
}

