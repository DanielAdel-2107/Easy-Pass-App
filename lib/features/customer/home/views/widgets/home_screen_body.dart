import 'dart:developer';

import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/customer/home/view_models/cubit/get_all_tickets_cubit.dart';
import 'package:easy_pass/features/customer/home/views/widgets/animated_text.dart';
import 'package:easy_pass/features/customer/home/views/widgets/category_grid_view.dart';
import 'package:easy_pass/features/customer/home/views/widgets/search_field.dart';
import 'package:easy_pass/features/customer/home/views/widgets/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllTicketsCubit(),
      child: BlocBuilder<GetAllTicketsCubit, GetAllTicketsState>(
        builder: (context, state) {
          if (state is GetAllTicketsLoading) {
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
          if (state is GetAllTicketsFailed) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.title24WhiteW500,
              ),
            );
          }
          return SafeArea(
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedText(
                      title: 'Welcome to Easy Pass!',
                    ),
                    SignOutButton(),
                  ],
                ),
                SearchField(
                  onChanged: (value) {
                    log(value);
                    context.read<GetAllTicketsCubit>().searchCategory(value);
                  },
                ),
                SizedBox(height: context.screenHeight * 0.02),
                CategoryGridView(
                  categoriesList: context.read<GetAllTicketsCubit>().searchCategories,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


