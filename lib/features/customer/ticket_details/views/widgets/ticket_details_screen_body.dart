import 'package:easy_pass/core/cache/cache_helper.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/ticket_details/views/widgets/bottom_action_bar.dart';
import 'package:easy_pass/features/customer/ticket_details/views/widgets/ticket_details_card.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/customer/home/views/widgets/animated_text.dart';
import 'package:flutter/material.dart';

class TicketDetailsBody extends StatelessWidget {
  const TicketDetailsBody({super.key, required this.ticket});
  final TicketModel ticket;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AnimatedText(title: ticket.ticketName),
          SizedBox(height: context.screenHeight * 0.015),
          Expanded(
            child: TicketDetailsCard(ticket: ticket),
          ),
          getIt<CacheHelper>().getUserModel()!.role != "Customer"
              ? SizedBox()
              : BottomActionBar(
                  ticketModel: ticket,
                ),
        ],
      ),
    );
  }
}
