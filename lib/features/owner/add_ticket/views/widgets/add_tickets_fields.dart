import 'package:easy_pass/core/components/custom_drop_down_button_form_field.dart';
import 'package:easy_pass/core/components/custom_text_form_field_with_title.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/owner/add_ticket/view_models/cubit/add_ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTicketFields extends StatelessWidget {
  const AddTicketFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddTicketCubit>().formKey,
      child: Column(
        spacing: context.screenHeight * 0.015,
        children: [
          CustomTextFormFieldWithTitle(
            controller: context.read<AddTicketCubit>().ticketNameController,
            hintText: "enter ticket name",
            title: "Ticket Name",
          ),
          CustomTextFormFieldWithTitle(
            controller: context.read<AddTicketCubit>().ticketLocationController,
            hintText: "enter ticket location",
            title: "Ticket location",
          ),
          CustomTextFormFieldWithTitle(
            controller: context.read<AddTicketCubit>().priceController,
            hintText: "enter ticket price",
            title: "Ticket Price",
          ),
          CustomDropDownButtonFormField(
            userRoles: context
                .read<AddTicketCubit>()
                .categories
                .map((e) => e.title)
                .toList(),
            controller: context.read<AddTicketCubit>().ticketTypeController,
            title: "Ticket Type",
          ),
          CustomTextFormFieldWithTitle(
            controller: context.read<AddTicketCubit>().moreDataController,
            hintText: "enter more data ( if available )",
            title: "More Data",
          ),
        ],
      ),
    );
  }
}
