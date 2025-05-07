import 'package:easy_pass/core/components/custom_icon_button.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/owner/my_ticket/view_models/cubit/my_tickets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTicketsCard extends StatelessWidget {
  const MyTicketsCard({
    super.key,
    required this.ticketModel,
  });

  final TicketModel ticketModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.02,
        vertical: context.screenHeight * 0.01,
      ),
      margin: EdgeInsets.only(
        bottom: context.screenHeight * 0.01,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              ticketModel.image,
              fit: BoxFit.cover,
              height: context.screenHeight * 0.12,
              width: context.screenWidth * 0.26,
            ),
          ),
          SizedBox(
            width: context.screenWidth * 0.02,
          ),
          SizedBox(
            width: context.screenWidth * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticketModel.ticketName,
                  style: AppTextStyles.title18WhiteW500,
                ),
                Text(
                  ticketModel.category,
                  style: AppTextStyles.title18WhiteW500,
                ),
                Text(
                  ticketModel.suspended ? "Suspended" : "Available",
                  style: AppTextStyles.title18WhiteW500,
                ),
              ],
            ),
          ),
          Column(
            children: [
              CustomIconButton(
                icon: Icons.event_available_outlined,
                onPressed: () {
                  context.read<MyTicketsCubit>().changeState(
                        id: ticketModel.id,
                        state: false,
                      );
                },
                iconColor: Colors.white,
              ),
              CustomIconButton(
                icon: Icons.event_busy_outlined,
                onPressed: () {
                  context.read<MyTicketsCubit>().changeState(
                        id: ticketModel.id,
                        state: true,
                      );
                },
                iconColor: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
