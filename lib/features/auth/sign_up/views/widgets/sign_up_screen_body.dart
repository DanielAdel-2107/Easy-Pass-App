import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/auth_title.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/logo_with_title.dart';
import 'package:easy_pass/features/auth/sign_up/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AuthTitle(
            title: "Create Your Account",
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.04,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                color: AppColors.kPrimaryColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LogoWithTitle(
                      title:
                          "Create an account to manage your event tickets and purchases effortlessly",
                      fromBottom: 0,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.04,
                    ),
                    SignUpForm()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
