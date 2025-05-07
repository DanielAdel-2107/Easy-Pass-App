import 'dart:async';
import 'package:easy_pass/core/di/dependancy_injection.dart';
import 'package:easy_pass/core/network/supabase/database/get_stream_data.dart';
import 'package:easy_pass/features/customer/home/models/category_model.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'get_all_tickets_state.dart';

class GetAllTicketsCubit extends Cubit<GetAllTicketsState> {
  GetAllTicketsCubit() : super(GetAllTicketsLoading()) {
    getAllCategories();
  }

  // get all categories
  getAllCategories() async {
    try {
      final response =
          await getIt<SupabaseClient>().from("categories").select().single();
      List<dynamic> rawCategories = response["categories"];
      categoriesList = rawCategories
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
      categoriesList.sort((a, b) => a.title.compareTo(b.title));
      searchCategories = categoriesList;
      emit(GetAllTicketsLoaded());

      getAllTickets();
    } catch (e) {
      emit(GetAllTicketsFailed(errorMessage: e.toString()));
    }
  }

  String selectedCategory = "All";
  List<TicketModel> selectCategory(String category) {
    selectedCategory = category;
    if (category == "All") {
      selectedCategorytickets = tickets;
      filteredTickets = selectedCategorytickets;
    } else {
      selectedCategorytickets = tickets
          .where((ticket) =>
              ticket.category.toLowerCase() == category.toLowerCase())
          .toList();
      filteredTickets = selectedCategorytickets;
    }
    emit(GetAllTicketsLoaded());
    return selectedCategorytickets;
  }

  //
  List<TicketModel> tickets = [];
  List<TicketModel> selectedCategorytickets = [];
  List<TicketModel> filteredTickets = [];
  List<CategoryModel> categoriesList = [];

  StreamSubscription? subscription;
  int retryCount = 0;
  final int maxRetries = 3;

  void getAllTickets() {
    subscription?.cancel();
    emit(GetAllTicketsLoading());
    subscription = streamData(tableName: "tickets").listen(
      (data) {
        retryCount = 0;
        if (data.isNotEmpty) {
          tickets = data.map((e) => TicketModel.fromJson(e)).toList();
          selectedCategorytickets = tickets;
          filteredTickets = tickets;
          emit(GetAllTicketsLoaded());
        } else {
          GetAllTicketsFailed(errorMessage: "No tickets found");
        }
      },
      onError: (error) {
        retryCount++;
        if (retryCount >= maxRetries) {
          emit(GetAllTicketsFailed(errorMessage: error));
        } else {
          getAllTickets();
        }
      },
      cancelOnError: true,
    );
  }

  //
  List<CategoryModel> searchCategories = [];
  searchCategory(String query) {
    if (query.isEmpty) {
      searchCategories = categoriesList;
      emit(GetAllTicketsLoaded());
    }
    searchCategories = categoriesList
        .where((ticket) =>
            ticket.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetAllTicketsLoaded());
  }

  //
  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
