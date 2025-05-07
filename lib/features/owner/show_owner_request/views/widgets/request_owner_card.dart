import 'package:easy_pass/core/components/custom_icon_button_with_background.dart';
import 'package:easy_pass/core/components/custom_text_button.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/customer/my_requests/models/request_model.dart';
import 'package:easy_pass/features/owner/show_owner_request/view_models/cubit/show_owner_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestOwnerCard extends StatelessWidget {
  const RequestOwnerCard({
    super.key,
    required this.requestModel,
    this.onPressed,
  });
  final RequestModel requestModel;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ShowOwnerRequestCubit>();
    return Card(
      color: Colors.black38,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.05,
          vertical: context.screenHeight * 0.01,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("User Name : ", style: AppTextStyles.title20WhiteW500),
                Text(requestModel.userName,
                    style: AppTextStyles.title20WhiteW500)
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ticket Name : ", style: AppTextStyles.title20WhiteW500),
                Expanded(
                  child: Text(
                    requestModel.ticketName,
                    style: AppTextStyles.title20WhiteW500,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ticket Status : ", style: AppTextStyles.title20WhiteW500),
                Text(requestModel.status, style: AppTextStyles.title20WhiteW500)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ticket Details : ",
                    style: AppTextStyles.title20WhiteW500),
                CustomTextButton(
                  title: "Show Details",
                  alignment: Alignment.center,
                  onPressed: onPressed,
                  backgroundColor: Colors.white24,
                )
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButtonWithBackground(
                  icon: Icons.done,
                  backgroundColor: Colors.black87,
                  iconColor: Colors.white,
                  onPressed: () {
                    cubit.acceptRequest(
                        requestId: requestModel.id,
                        ticketId: requestModel.ticketId);
                  },
                ),
                CustomIconButtonWithBackground(
                  icon: Icons.close,
                  backgroundColor: Colors.black87,
                  iconColor: Colors.white,
                  onPressed: () {
                    cubit.rejectRequest(requestId: requestModel.id);
                  },
                ),
                requestModel.status == "Accepted"
                    ? CustomIconButtonWithBackground(
                        icon: Icons.chat,
                        backgroundColor: Colors.black87,
                        iconColor: Colors.white,
                        onPressed: () {
                          cubit.openChat(
                              ticketId: requestModel.ticketId,
                              userId: requestModel.userId);
                        },
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
