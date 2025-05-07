import 'package:bloc/bloc.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());
  // sign out
  signOut() async {
    try {
      emit(SignOutLoading());
      await getIt<SupabaseClient>().auth.signOut();
      // getIt<CacheHelper>().removeData(key: "userRole");
      emit(SignOutSuccess());
    } on Exception catch (e) {
      emit(
        SignOutFailed(message: e.toString()),
      );
    }
  }
}
