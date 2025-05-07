import 'dart:developer';

import 'package:easy_pass/core/cache/cache_helper.dart';
import 'package:easy_pass/core/app_route/route_names.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/network/supabase/auth/sign_in_with_password.dart';
import 'package:easy_pass/features/auth/sign_in/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final supabase = getIt<SupabaseClient>();
  UserModel? user;
  String route = "";
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        await signInWithPassword(
            email: emailController.text, password: passwordController.text);
        emit(SignInSuccess(routeName: await getHomeScreen()));
        log(user.toString());
      } on Exception catch (e) {
        emit(SignInFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<String> getHomeScreen() async {
    var data = await getIt<SupabaseClient>()
        .from("users")
        .select()
        .eq("id", getIt<SupabaseClient>().auth.currentUser!.id)
        .single();
    user = UserModel.fromJson(data);
    await getIt<CacheHelper>().saveUserModel(user!);
    if (data["role"] == "Customer") {
      return RouteNames.homeScreen;
    } else {
      return RouteNames.addTicketScreen;
    }
  }
}
