import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/owner/my_ticket/view_models/cubit/my_tickets_cubit.dart';
import 'package:easy_pass/features/owner/my_ticket/views/widgets/my_tickets_card.dart';
import 'package:flutter/material.dart';

class MyTicketsListView extends StatelessWidget {
  const MyTicketsListView({
    super.key,
    required this.cubit,
  });

  final MyTicketsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.02,
        ),
        itemCount: cubit.tickets.length,
        itemBuilder: (context, index) {
          return MyTicketsCard(ticketModel: cubit.tickets[index],);
        },
      ),
    );
  }
}
