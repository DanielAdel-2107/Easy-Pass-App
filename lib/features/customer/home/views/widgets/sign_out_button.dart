import 'package:easy_pass/core/cache/cache_helper.dart';
import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/components/custom_icon_button.dart';
import 'package:easy_pass/core/components/quick_alert.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/customer/home/view_models/cubit/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(),
      child: BlocConsumer<SignOutCubit, SignOutState>(
        listener: (context, state) {
          if (state is SignOutSuccess) {
            context.pushAndRemoveUntilScreen(RouteNames.signInScreen);
            quickAlert(
              title: "Success",
              text: "Sign out successfully",
              type: QuickAlertType.success,
            );
          }
          if (state is SignOutFailed) {
            quickAlert(
              title: "Failed",
              text: state.message,
              type: QuickAlertType.error,
            );
          }
        },
        builder: (context, state) {
          return Align(
            alignment: Alignment.centerRight,
            child: state is SignOutLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : CustomIconButton(
                    icon: Icons.logout_rounded,
                    onPressed: () {
                      quickAlert(
                        title: "Sign out",
                        text: "Are you sure you want to sign out",
                        type: QuickAlertType.info,
                        onConfirmBtnTap: () async {
                          await getIt<CacheHelper>()
                              .removeData(key: "userRole");
                          context.read<SignOutCubit>().signOut();
                        },
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
