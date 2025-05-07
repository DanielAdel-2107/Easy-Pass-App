import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/network/supabase/database/add_data.dart';
import 'package:easy_pass/core/network/supabase/database/stream_data_with_spacific.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:easy_pass/features/customer/my_requests/models/request_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'get_customer_requests_state.dart';

class GetCustomerRequestsCubit extends Cubit<GetCustomerRequestsState> {
  GetCustomerRequestsCubit() : super(GetCustomerRequestsInitial()) {
    getAllRequests();
  }
  List<RequestModel> requests = [];
  StreamSubscription? subscription;
  int retryCount = 0;
  final int maxRetries = 3;

  void getAllRequests() {
    subscription?.cancel();
    emit(GetCustomerRequestsLoading());
    subscription = streamDataWithSpecificId(
      tableName: "requests",
      id: getIt<SupabaseClient>().auth.currentUser!.id,
      primaryKey: "user_id",
    ).listen(
      (data) {
        retryCount = 0;
        if (data.isNotEmpty) {
          requests = data.map((e) => RequestModel.fromJson(e)).toList();
          emit(GetCustomerRequestsSuccess());
        } else {
          emit(GetCustomerRequestsFailed(errorMessage: "No tickets found"));
        }
      },
      onError: (error) {
        retryCount++;
        if (retryCount >= maxRetries) {
          emit(GetCustomerRequestsFailed(errorMessage: error));
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
      emit(GetRequestsLoading());
      var data = await getIt<SupabaseClient>()
          .from("tickets")
          .select()
          .eq("id", ticketId)
          .single();
      emit(GetRequestsSuccess(ticketModel: TicketModel.fromJson(data)));
    } catch (e) {
      emit(GetRequestsFailed(errorMessage: e.toString()));
    }
  }

  //! book ticket
  resellTicket({
    required RequestModel requestModel,
  }) async {
    try {
      emit(ResellTicketLoading());
      var data = await getIt<SupabaseClient>()
          .from("tickets")
          .select()
          .eq("image", requestModel.image)
          .eq("admin_id", getIt<SupabaseClient>().auth.currentUser!.id)
          .maybeSingle();
      if (data != null) {
        emit(ResellTicketAlreadyExists());
        return;
      }
      await addData(tableName: "tickets", data: {
        "admin_id": getIt<SupabaseClient>().auth.currentUser!.id,
        "ticket_name": requestModel.ticketName,
        "ticket_location": requestModel.ticketLocation,
        "price": requestModel.price,
        "more_data": requestModel.moreData,
        "ticket_type": requestModel.ticketType,
        "image": requestModel.image,
        "to_time": requestModel.toTime,
        "from_time": requestModel.fromTime,
        "date": requestModel.date,
        "resell": true
      });
      await getIt<SupabaseClient>()
          .from("requests")
          .delete()
          .match({"id": requestModel.id});
      emit(ResellTicketSuccess());
    } on Exception catch (e) {
      emit(ResellTicketFailed(error: e.toString()));
    }
  }
}
