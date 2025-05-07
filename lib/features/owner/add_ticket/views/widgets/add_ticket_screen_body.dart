import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/components/custom_elevated_button.dart';
import 'package:easy_pass/core/components/quick_alert.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/home/views/widgets/animated_text.dart';
import 'package:easy_pass/features/customer/home/views/widgets/sign_out_button.dart';
import 'package:easy_pass/features/owner/add_ticket/view_models/cubit/add_ticket_cubit.dart';
import 'package:easy_pass/features/owner/add_ticket/views/widgets/add_tickets_fields.dart';
import 'package:easy_pass/features/owner/add_ticket/views/widgets/custom_divider.dart';
import 'package:easy_pass/features/owner/add_ticket/views/widgets/pick_image.dart';
import 'package:easy_pass/features/owner/add_ticket/views/widgets/select_data_and_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';


class AddTicketScreenBody extends StatelessWidget {
  const AddTicketScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTicketCubit(),
      child: BlocConsumer<AddTicketCubit, AddTicketState>(
        listener: (context, state) {
          if (state is AddTicketFiledsEmpty) {
            quickAlert(
              type: QuickAlertType.info,
              title: "Hint",
              text: "Please fill all fileds",
            );
          }
          if (state is AddTicketFailure) {
            quickAlert(
              type: QuickAlertType.error,
              text: state.message,
              title: "Failure",
            );
          }
          if (state is AddTicketSuccess) {
            context.pushReplacementScreen(RouteNames.addTicketScreen);
            quickAlert(
              type: QuickAlertType.success,
              text: "Ticket added successfully",
              title: "Success",
            );
          }
          if (state is AddTicketLoading) {
            quickAlert(
              type: QuickAlertType.loading,
              title: "Loading",
            );
            context.popScreen();
          }
        },
        builder: (context, state) {
          if (state is AddTicketLoading) {
             Center(
            child: SizedBox(
              width: context.screenWidth * 0.5,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: const [Colors.white],
                strokeWidth: 2,
              ),
            ),
          );
          }
          return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: context.screenWidth * 0.03,
                right: context.screenWidth * 0.03,
                bottom: context.screenHeight * 0.01,
              ),
              child: Column(
                children: [
                  SizedBox(height: context.screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedText(
                        title: 'Welcome to Easy Pass!',
                      ),
                      SignOutButton(),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  PickImage(),
                  SizedBox(
                    height: context.screenHeight * 0.05,
                  ),
                  AddTicketFields(),
                  SizedBox(
                    height: context.screenHeight * 0.007,
                  ),
                  CustomDivider(),
                  SizedBox(
                    height: context.screenHeight * 0.006,
                  ),
                  SelectDateAndTime(),
                  SizedBox(
                    height: context.screenHeight * 0.03,
                  ),
                  BlocBuilder<AddTicketCubit, AddTicketState>(
                    builder: (context, state) {
                      return CustomElevatedButton(
                        name: "Add Ticket",
                        onPressed: () {
                          context.read<AddTicketCubit>().addTicket();
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          );
        },
      ),
    );
  }
}
