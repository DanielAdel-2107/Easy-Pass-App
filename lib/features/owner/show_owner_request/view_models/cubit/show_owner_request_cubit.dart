import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/network/supabase/database/stream_data_with_spacific.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/customer/my_requests/models/request_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'show_owner_request_state.dart';

class ShowOwnerRequestCubit extends Cubit<ShowOwnerRequestState> {
  ShowOwnerRequestCubit() : super(ShowOwnerRequestInitial()) {
    getAllRequests();
  }
  List<RequestModel> requests = [];
  StreamSubscription? subscription;
  int retryCount = 0;
  final int maxRetries = 3;
  final supabase = getIt<SupabaseClient>();

  void getAllRequests() {
    subscription?.cancel();
    emit(ShowOwnerRequestLoading());
    subscription = streamDataWithSpecificId(
      tableName: "requests",
      id: getIt<SupabaseClient>().auth.currentUser!.id,
      primaryKey: "owner_id",
    ).listen(
      (data) {
        retryCount = 0;
        if (data.isNotEmpty) {
          requests = data.map((e) => RequestModel.fromJson(e)).toList();
          emit(ShowOwnerRequestSuccess());
        } else {
          ShowOwnerRequestFailed(message: "No requests found");
        }
      },
      onError: (error) {
        retryCount++;
        if (retryCount >= maxRetries) {
          emit(ShowOwnerRequestFailed(message: error));
        } else {
          getAllRequests();
        }
      },
      cancelOnError: true,
    );
  }

  //
  getRequestsDetails({required String ticketId}) async {
    try {
      emit(ShowRequestLoading());
      var data = await getIt<SupabaseClient>()
          .from("tickets")
          .select()
          .eq("id", ticketId)
          .single();
      emit(ShowRequestSuccess(ticketModel: TicketModel.fromJson(data)));
    } catch (e) {
      emit(ShowRequestFailed(message: e.toString()));
    }
  }

  // accept request
  Future<void> acceptRequest(
      {required String requestId, required String ticketId}) async {
    try {
      emit(AcceptRequestLoading());
      await supabase
          .from("requests")
          .update({"status": "Accepted"}).eq("id", requestId);
      emit(AcceptRequestSuccess());
    } catch (e) {
      emit(AcceptRequestFailed(message: e.toString()));
    }
  }

  // accept request
  Future<void> rejectRequest({required String requestId}) async {
    try {
      emit(RejectRequestLoading());
      await supabase
          .from("requests")
          .update({"status": "Rejected"}).eq("id", requestId);
      emit(RejectRequesSuccess());
    } catch (e) {
      emit(RejectRequesFailed(message: e.toString()));
    }
  }

  // open chat
  Future<void> openChat(
      {required String ticketId, required String userId}) async {
    try {
      emit(OpenChatLoading());
      await supabase.from("chats").upsert({"id": ticketId + userId});
      emit(OpenChatSuccess(messageId: ticketId + userId));
    } catch (e) {
      emit(OpenChatFailed(message: e.toString()));
    }
  }
}
