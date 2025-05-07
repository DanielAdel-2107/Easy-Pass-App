import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/components/custom_elevated_button.dart';
import 'package:easy_pass/core/components/custom_icon_button_with_background.dart';
import 'package:easy_pass/core/components/quick_alert.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/customer/ticket_details/view_models/cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({
    super.key,
    required this.ticketModel,
  });
  final TicketModel ticketModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit(),
      child: BlocConsumer<BookCubit, BookState>(
        listener: (context, state) {
          if (state is BookSuccess) {
            quickAlert(
              type: QuickAlertType.success,
              text: "Wait form responde from owner ",
              title: "Ticket Booked Successfully",
            );
          }
          if (state is SuspendTicket) {
            quickAlert(
              type: QuickAlertType.info,
              text: "This ticket is suspended you can't book it",
              title: "Hint",
            );
          }
          if (state is ThisIsMyTicket) {
            quickAlert(
              type: QuickAlertType.info,
              text: "This is your ticket",
              title: "Hint",
            );
          }
          if (state is BookFailed) {
            quickAlert(
              type: QuickAlertType.error,
              text: state.error,
              title: "Failure",
            );
          }
          if (state is OpenChatFailed) {
            quickAlert(
              type: QuickAlertType.error,
              text: state.error,
              title: "Failure",
            );
          }
          if (state is TicketAlreadyBooked) {
            quickAlert(
              type: QuickAlertType.info,
              text: "Ticket Already Booked",
              title: "Hint",
            );
          }

          if (state is OpenChatSuccess) {
            context.pushScreen(
              RouteNames.chatScreen,
              arguments:
                  ticketModel.id + getIt<SupabaseClient>().auth.currentUser!.id,
            );
            quickAlert(
              type: QuickAlertType.success,
              title: "Success",
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<BookCubit>();
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.02,
              vertical: context.screenHeight * 0.005,
            ),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.04,
              vertical: context.screenHeight * 0.015,
            ),
            child: Row(
              mainAxisAlignment: state is BookLoading
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.spaceBetween,
              children: [
                state is BookLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : CustomElevatedButton(
                        width: context.screenWidth * 0.75,
                        height: context.screenHeight * 0.06,
                        name: "Book Now",
                        onPressed: () {
                          cubit.bookTicket(
                            ticketModel: ticketModel,
                          );
                        },
                      ),
                state is OpenChatLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : CustomIconButtonWithBackground(
                        icon: Icons.chat_bubble,
                        backgroundColor: Colors.white,
                        iconColor: Colors.black87,
                        onPressed: () {
                          cubit.openChat(
                            adminId: ticketModel.adminId,
                            ticketId: ticketModel.id,
                          );
                        },
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
