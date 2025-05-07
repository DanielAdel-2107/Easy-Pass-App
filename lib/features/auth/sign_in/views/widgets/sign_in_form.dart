import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/components/custom_elevated_button.dart';
import 'package:easy_pass/core/components/custom_text_button.dart';
import 'package:easy_pass/core/components/custom_text_form_field_with_title.dart';
import 'package:easy_pass/core/components/quick_alert.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/auth/sign_in/view_models/sign_in_cubit.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/or_login_with.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/soical_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            context.pushReplacementScreen(state.routeName);
            quickAlert(
              type: QuickAlertType.success,
              text: "Sign in successfully",
              title: "Success",
            );
          }
          if (state is SignInFailure) {
            context.popScreen();
            quickAlert(
              type: QuickAlertType.error,
              text: state.errorMessage,
              title: "Failure",
            );
          }
          if (state is SignInLoading) {
            quickAlert(
              type: QuickAlertType.loading,
              title: "Loading...",
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<SignInCubit>();
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                CustomTextFormFieldWithTitle(
                  hintText: "enter your email",
                  title: "Email",
                  controller: cubit.emailController,
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: "enter your password",
                  title: "Password",
                  controller: cubit.passwordController,
                  isPassword: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      title: "Forgot Password?",
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CustomElevatedButton(
                  name: "Sign In",
                  onPressed: () {
                    cubit.signIn();
                  },
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                OrLoginWith(),
                SocialAuth(),
                HaveAccountOrNot(
                  title: "Don't have an account?",
                  btnText: "Sign Up",
                  onPressed: () {
                    context.pushScreen(RouteNames.signUpScreen);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
