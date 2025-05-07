import 'package:easy_pass/core/utilies/colors/app_colors.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/auth_title.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/logo_with_title.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          AuthTitle(
            title: "Welcome Back!",
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
                      title: "Please login with your personal information",
                      fromBottom: context.screenHeight * 0.01,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.03,
                    ),
                    SignInForm()
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
