import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/components/quick_alert.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/owner/show_owner_request/view_models/cubit/show_owner_request_cubit.dart';
import 'package:easy_pass/features/owner/show_owner_request/views/widgets/request_owner_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';

class RequestListView extends StatelessWidget {
  final String type;
  const RequestListView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowOwnerRequestCubit, ShowOwnerRequestState>(
      listener: (context, state) {
        if (state is ShowRequestFailed ||
            state is AcceptRequestFailed ||
            state is RejectRequesFailed ||
            state is OpenChatFailed) {
          quickAlert(
            type: QuickAlertType.error,
            title: "Failed",
            text: (state as dynamic).message,
          );
        } else if (state is ShowRequestSuccess) {
          context.pushScreen(RouteNames.ticketDetailsScreen,
              arguments: state.ticketModel.toJson());
        } else if (state is AcceptRequestSuccess) {
          quickAlert(
            type: QuickAlertType.success,
            title: "Success",
            text: "Request Accepted Successfully",
          );
        } else if (state is RejectRequesSuccess) {
          quickAlert(
            type: QuickAlertType.success,
            title: "Success",
            text: "Request Rejected Successfully",
          );
        } else if (state is OpenChatSuccess) {
          context.pushScreen(RouteNames.chatScreen, arguments: state.messageId);
        }
      },
      builder: (context, state) {
        final cubit = context.read<ShowOwnerRequestCubit>();
        final requests = cubit.requests.where((e) => e.status == type).toList();
        if (requests.isEmpty) {
          return Center(
            child: Text("No $type Requests",
                style: AppTextStyles.title20WhiteW500),
          );
        }
        if (state is ShowRequestLoading ||
            state is AcceptRequestLoading ||
            state is RejectRequestLoading ||
            state is OpenChatLoading) {
          return Center(
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
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: requests.length,
          itemBuilder: (context, index) {
            return RequestOwnerCard(
              requestModel: requests[index],
              onPressed: () {
                cubit.getRequestsDetails(ticketId: requests[index].ticketId);
              },
            );
          },
        );
      },
    );
  }
}
