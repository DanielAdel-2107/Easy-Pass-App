import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/network/supabase/database/stream_data_with_spacific.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'my_tickets_state.dart';

class MyTicketsCubit extends Cubit<GetMyTicketsState> {
  MyTicketsCubit() : super(GetMyTicketsInitial()) {
    getAllRequests();
  }
  List<TicketModel> tickets = [];
  StreamSubscription? subscription;
  int retryCount = 0;
  final int maxRetries = 3;
  final supabase = getIt<SupabaseClient>();

  void getAllRequests() {
    subscription?.cancel();
    emit(GetMyTicketsLoading());
    subscription = streamDataWithSpecificId(
      tableName: "tickets",
      id: getIt<SupabaseClient>().auth.currentUser!.id,
      primaryKey: "admin_id",
    ).listen(
      (data) {
        retryCount = 0;
        if (data.isNotEmpty) {
          tickets = data.map((e) => TicketModel.fromJson(e)).toList();
          emit(GetMyTicketsSuccess());
        } else {
          GetMyTicketsFailed(message: "No tickets found");
        }
      },
      onError: (error) {
        retryCount++;
        if (retryCount >= maxRetries) {
          emit(GetMyTicketsFailed(message: error));
        } else {
          getAllRequests();
        }
      },
      cancelOnError: true,
    );
  }

  //! change state
  changeState({required String id, required bool state}) async {
    try {
      emit(ChangeStateLoading());
      await supabase.from("tickets").update({"suspended": state}).eq("id", id);
      emit(ChangeStateSuccess());
    } on Exception catch (e) {
      emit(ChangeStateFailed(message: e.toString()));
    }
  }
}
