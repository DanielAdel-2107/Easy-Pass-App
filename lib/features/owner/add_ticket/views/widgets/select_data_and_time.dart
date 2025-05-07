import 'package:easy_pass/features/owner/add_ticket/view_models/cubit/add_ticket_cubit.dart';
import 'package:easy_pass/features/owner/add_ticket/views/widgets/custom_divider.dart';
import 'package:easy_pass/features/owner/add_ticket/views/widgets/select_date.dart';
import 'package:easy_pass/features/owner/add_ticket/views/widgets/select_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDateAndTime extends StatelessWidget {
  const SelectDateAndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectDate(
          onPressed: () {
            context.read<AddTicketCubit>().pickDate();
          },
        ),
        CustomDivider(),
        BlocBuilder<AddTicketCubit, AddTicketState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectTime(
                  title: "From Time :",
                  time: context.read<AddTicketCubit>().selectedStartTime,
                  onPressed: () {
                    context.read<AddTicketCubit>().pickTime(timeCycle: "From");
                  },
                ),
                SelectTime(
                  title: "To Time :",
                  time: context.read<AddTicketCubit>().selectedEndTime,
                  onPressed: () {
                    context.read<AddTicketCubit>().pickTime(timeCycle: "To");
                  },
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
