import 'package:easy_pass/core/components/custom_drop_down_button_form_field.dart';
import 'package:easy_pass/core/components/custom_elevated_button.dart';
import 'package:easy_pass/core/components/custom_text_form_field_with_title.dart';
import 'package:easy_pass/core/components/quick_alert.dart';
import 'package:easy_pass/core/utilies/extensions/app_extensions.dart';
import 'package:easy_pass/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:easy_pass/features/auth/sign_up/view_models/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            context.popScreen();
            context.popScreen();
            quickAlert(
              type: QuickAlertType.success,
              text: "Create Account Successfully",
              title: "Success",
            );
          }
          if (state is SignUpFailure) {
            context.popScreen();
            quickAlert(
              type: QuickAlertType.error,
              text: state.errorMessage,
              title: "Failure",
            );
          }
          if (state is SignUpFieldsRequired) {
            context.popScreen();
            quickAlert(
              type: QuickAlertType.info,
              text: "Please fill the required fields",
              title: "Hint Required",
            );
          }
          if (state is SignUpLoading) {
            quickAlert(
              type: QuickAlertType.loading,
              title: "Loading...",
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<SignUpCubit>();
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                CustomTextFormFieldWithTitle(
                  hintText: "enter your name",
                  title: "Name",
                  controller: cubit.fullNameController,
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: "enter your email",
                  title: "Email",
                  controller: cubit.emailController,
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CustomDropDownButtonFormField(
                  userRoles: ["Customer", "Brand Or Owner"],
                  title: "Select your role",
                  hintText: "Select Your Role",
                  controller: cubit.roleController,
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: "enter your password",
                  title: "Password",
                  isPassword: true,
                  controller: cubit.passwordController,
                ),
                SizedBox(
                  height: context.screenHeight * 0.04,
                ),
                CustomElevatedButton(
                  name: "Sign Up",
                  onPressed: () {
                    cubit.signUp();
                  },
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                HaveAccountOrNot(
                  title: "Have an account?",
                  btnText: "Sign In",
                  onPressed: () {
                    context.popScreen();
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
