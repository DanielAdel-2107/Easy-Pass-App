import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/components/quick_alert.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/customer/my_requests/models/request_model.dart'
    show RequestModel;
import 'package:easy_pass/features/customer/my_requests/view_models/cubit/get_customer_requests_cubit.dart';
import 'package:easy_pass/features/customer/my_requests/views/widgets/request_card.dart';
import 'package:easy_pass/features/customer/my_requests/views/widgets/triple_bottom_wave_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';

class MyRequestScreenBody extends StatelessWidget {
  const MyRequestScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * 0.2,
          width: double.infinity,
          child: CustomPaint(
            painter: TripleBottomWavePainter(),
          ),
        ),
        Text(
          'My Requests',
          style: AppTextStyles.title24WhiteW500,
        ),
        Expanded(
          child: BlocProvider(
            create: (context) => GetCustomerRequestsCubit(),
            child: BlocConsumer<GetCustomerRequestsCubit,
                GetCustomerRequestsState>(
              listener: (context, state) {
                if (state is GetRequestsFailed) {
                  quickAlert(
                      type: QuickAlertType.error,
                      title: "Failed",
                      text: state.errorMessage);
                }
                if (state is ResellTicketAlreadyExists) {
                  quickAlert(
                    type: QuickAlertType.info,
                    title: "Hint",
                    text: "You already have a resell ticket",
                  );
                }
                if (state is ResellTicketFailed) {
                  quickAlert(
                    type: QuickAlertType.error,
                    title: "Failed",
                    text: state.error,
                  );
                }
                if (state is ResellTicketSuccess) {
                  context.popScreen();
                  quickAlert(
                    type: QuickAlertType.success,
                    title: "Success",
                    text: "Resell ticket Added successfully",
                  );
                }
                if (state is GetRequestsSuccess) {
                  context.pushScreen(RouteNames.ticketDetailsScreen,
                      arguments: state.ticketModel.toJson());
                }
              },
              builder: (context, state) {
                var cubit = context.read<GetCustomerRequestsCubit>();
                if (state is GetCustomerRequestsLoading||state is ResellTicketLoading) {
                  return Center(
                    child: SizedBox(
                      width: context.screenWidth * 0.6,
                      child: LoadingIndicator(
                        indicatorType: Indicator.lineSpinFadeLoader,
                        colors: const [Colors.white],
                        strokeWidth: 2,
                      ),
                    ),
                  );
                }
                if (state is GetCustomerRequestsFailed) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyles.title24WhiteW500,
                    ),
                  );
                }
                return DefaultTabController(
                    length: 2,
                    child: RequestsListView(requests: cubit.requests));
              },
            ),
          ),
        )
      ],
    );
  }
}

class RequestsListView extends StatelessWidget {
  const RequestsListView({
    super.key,
    required this.requests,
  });

  final List<RequestModel> requests;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requests.length,
      padding: EdgeInsets.only(
        top: context.screenHeight * 0.01,
        right: context.screenWidth * 0.02,
        left: context.screenWidth * 0.02,
      ),
      itemBuilder: (context, index) {
        return RequestCustomerCard(
          requestModel: requests[index],
          onPressed: () {
            context
                .read<GetCustomerRequestsCubit>()
                .getRequestsDetails(ticketId: requests[index].ticketId);
          },
        );
      },
    );
  }
}
