import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/customer/home/views/widgets/animated_text.dart';
import 'package:easy_pass/features/customer/home/views/widgets/search_field.dart';
import 'package:easy_pass/features/customer/home/views/widgets/ticket_grid.dart';
import 'package:easy_pass/features/customer/select_category/view_models/cubit/search_tickets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCategoryScreenBody extends StatelessWidget {
  const SelectCategoryScreenBody({
    super.key,
    this.tickets,
  });

  final List<TicketModel>? tickets;

  @override
  Widget build(BuildContext context) {
    if (tickets == null || tickets!.isEmpty) {
      return Center(
        child: AnimatedText(
          title: "No Tickets Found",
        ),
      );
    }

    return BlocProvider(
      create: (context) =>
          SearchTicketsCubit(selectedCategorytickets: tickets!),
      child: BlocBuilder<SearchTicketsCubit, SearchTicketsState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedText(
                      title: "${tickets!.first.category} Tickets",
                    ),
                  ],
                ),
                SearchField(
                  onChanged: (value) {
                    context
                        .read<SearchTicketsCubit>()
                        .searchTickets(query: value);
                  },
                ),
                SizedBox(height: context.screenHeight * 0.02),
                TicketGrid(
                  tickets:
                      context.read<SearchTicketsCubit>().filteredTickets ?? [],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
