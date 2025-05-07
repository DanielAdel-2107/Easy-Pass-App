import 'package:easy_pass/core/components/quick_alert.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/core/utilies/styles/app_text_styles.dart';
import 'package:easy_pass/features/customer/my_requests/views/widgets/triple_bottom_wave_painter.dart';
import 'package:easy_pass/features/owner/my_ticket/view_models/cubit/my_tickets_cubit.dart';
import 'package:easy_pass/features/owner/my_ticket/views/widgets/my_tickets_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';

class MyTicketsScreenBody extends StatelessWidget {
  const MyTicketsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * 0.25,
          width: double.infinity,
          child: CustomPaint(
            painter: TripleBottomWavePainter(),
          ),
        ),
        Text(
          "My Tickets",
          style: AppTextStyles.title28WhiteW500,
        ),
        SizedBox(height: context.screenHeight * 0.05),
        BlocProvider(
          create: (context) => MyTicketsCubit(),
          child: BlocConsumer<MyTicketsCubit, GetMyTicketsState>(
            listener: (context, state) {
              if (state is ChangeStateSuccess) {
                context.popScreen();
                quickAlert(
                  type: QuickAlertType.success,
                  title: "Success",
                  text: "State changed successfully",
                );
              }
              if (state is ChangeStateFailed) {
                context.popScreen();
                quickAlert(
                  type: QuickAlertType.success,
                  title: "Failed",
                  text: state.message,
                );
              }
            },
            builder: (context, state) {
              var cubit = context.read<MyTicketsCubit>();
              return MyTicketsListView(cubit: cubit);
            },
          ),
        )
      ],
    );
  }
}
