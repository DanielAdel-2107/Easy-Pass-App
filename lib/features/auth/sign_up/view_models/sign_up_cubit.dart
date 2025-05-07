import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/network/supabase/auth/sign_up_with_password.dart';
import 'package:easy_pass/core/network/supabase/database/add_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final roleController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signUp() async {
    if (formKey.currentState!.validate() && roleController.text.isNotEmpty) {
      try {
        emit(SignUpLoading());
        await signUpWithPassword(
            email: emailController.text, password: passwordController.text);
        await addData(
          tableName: "users",
          data: {
            "id": getIt<SupabaseClient>().auth.currentUser!.id,
            "name": fullNameController.text,
            "email": emailController.text,
            "role": roleController.text,
          },
        );
        emit(SignUpSuccess());
      } on Exception catch (e) {
        emit(SignUpFailure(errorMessage: e.toString()));
      }
    }else{
      emit(SignUpFieldsRequired());
    }
  }
}
