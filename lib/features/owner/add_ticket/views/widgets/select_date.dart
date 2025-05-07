import 'package:easy_pass/core/components/custom_text_button.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/owner/add_ticket/view_models/cubit/add_ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDate extends StatelessWidget {
  const SelectDate({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTicketCubit, AddTicketState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date ",
                  style: AppTextStyles.title20WhiteW500,
                ),
                CustomTextButton(
                  title: "Select Date",
                  backgroundColor: Colors.black45,
                  onPressed: onPressed,
                  alignment: Alignment.center,
                )
              ],
            ),
            context.read<AddTicketCubit>().formatSelectedDate == null
                ? SizedBox()
                : Text(
                    "${context.read<AddTicketCubit>().formatSelectedDate}    🗓️",
                    style: AppTextStyles.title18WhiteW500,
                  ),
          ],
        );
      },
    );
  }
}
