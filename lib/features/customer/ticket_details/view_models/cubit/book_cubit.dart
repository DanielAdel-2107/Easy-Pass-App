import 'package:bloc/bloc.dart';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/network/supabase/database/add_data.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());
  //! book ticket
  bookTicket({
    required TicketModel ticketModel,
  }) async {
    try {
      emit(BookLoading());
      var data = await getIt<SupabaseClient>()
          .from("requests")
          .select()
          .eq("ticket_id", ticketModel.id)
          .eq("user_id", getIt<SupabaseClient>().auth.currentUser!.id)
          .maybeSingle();
      if (data != null) {
        emit(TicketAlreadyBooked());
        return;
      }
      if (ticketModel.adminId == getIt<SupabaseClient>().auth.currentUser!.id) {
        emit(ThisIsMyTicket());
        return;
      }
      if (ticketModel.suspended) {
        emit(SuspendTicket());
        return;
      }
      var userData = await getIt<SupabaseClient>()
          .from("users")
          .select()
          .eq("id", getIt<SupabaseClient>().auth.currentUser!.id)
          .single();
      await addData(
        tableName: "requests",
        data: {
          "ticket_id": ticketModel.id,
          "user_id": getIt<SupabaseClient>().auth.currentUser!.id,
          "owner_id": ticketModel.adminId,
          "user_name": userData["name"],
          "ticket_name": ticketModel.ticketName,
          "ticket_location": ticketModel.ticketLocation,
          "price": ticketModel.price,
          "more_data": ticketModel.moreData,
          "ticket_type": ticketModel.category,
          "image": ticketModel.image,
          "to_time": ticketModel.toTime,
          "from_time": ticketModel.fromTime,
          "date": ticketModel.date,
        },
      );
      emit(BookSuccess());
    } on Exception catch (e) {
      emit(BookFailed(error: e.toString()));
    }
  }

  //! open chat
  openChat({
    required String ticketId,
    required String adminId,
  }) async {
    try {
      emit(OpenChatLoading());
      await addData(
        tableName: "chats",
        data: {
          "id": ticketId + getIt<SupabaseClient>().auth.currentUser!.id,
          "user_id": getIt<SupabaseClient>().auth.currentUser!.id,
          "ticket_id": ticketId,
          "owner_id": adminId,
        },
      );
      emit(OpenChatSuccess());
    } on Exception catch (e) {
      emit(OpenChatFailed(error: e.toString()));
    }
  }
}
