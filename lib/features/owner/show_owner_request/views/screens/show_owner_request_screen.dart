import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/owner/show_owner_request/view_models/cubit/show_owner_request_cubit.dart';
import 'package:easy_pass/features/owner/show_owner_request/views/widgets/requests_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ShowOwnerRequestScreen extends StatelessWidget {
  const ShowOwnerRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BlocProvider(
        create: (_) => ShowOwnerRequestCubit(),
        child: Scaffold(
          backgroundColor: AppColors.kPrimaryColor,
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.kPrimaryColor,
            elevation: 0,
            title:
                const Text("Requests", style: TextStyle(color: Colors.white)),
            bottom: TabBar(
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(
                vertical: context.screenHeight * 0.007,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: AppTextStyles.title20PrimaryColorW500,
              unselectedLabelStyle: AppTextStyles.title18GreyW500,
              indicatorPadding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.02,
                vertical: context.screenHeight * 0.007,
              ),
              dividerHeight: 0,
              tabs: [
                Tab(text: "Pending"),
                Tab(text: "Accepted"),
                Tab(text: "Rejected"),
              ],
            ),
          ),
          body: BlocBuilder<ShowOwnerRequestCubit, ShowOwnerRequestState>(
            builder: (context, state) {
              if (state is ShowOwnerRequestLoading) {
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
              return const TabBarView(
                children: [
                  RequestListView(type: 'Pending'),
                  RequestListView(type: 'Accepted'),
                  RequestListView(type: 'Rejected'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
