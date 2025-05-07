import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/customer/home/views/widgets/ticket_card.dart';
import 'package:flutter/material.dart';

class TicketGrid extends StatelessWidget {
  const TicketGrid({super.key, required this.tickets});
  final List<TicketModel> tickets;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: tickets.isEmpty
          ? Center(
              child: Text(
                "No tickets found",
                style: AppTextStyles.title24WhiteW500,
              ),
            )
          : GridView.builder(
              itemCount: tickets.length,
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.015),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.63,
                mainAxisSpacing: context.screenWidth * 0.015,
                crossAxisSpacing: context.screenWidth * 0.015,
              ),
              itemBuilder: (context, index) => TicketCard(
                ticketModel: tickets[index],
              ),
            ),
    );
  }
}
