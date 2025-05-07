import 'package:bloc/bloc.dart';
import 'package:easy_pass/features/customer/home/models/ticket_model.dart';
import 'package:meta/meta.dart';

part 'search_tickets_state.dart';

class SearchTicketsCubit extends Cubit<SearchTicketsState> {
  SearchTicketsCubit({required this.selectedCategorytickets})
      : super(SearchTicketsInitial()){
        filteredTickets = selectedCategorytickets;
      }
  //
  List<TicketModel>? filteredTickets;
  List<TicketModel> selectedCategorytickets;
  searchTickets({
    required String query,
  }) {
    if (query.isEmpty) {
      filteredTickets = selectedCategorytickets;
      emit(TicketsLoaded());
    }
    filteredTickets = selectedCategorytickets
        .where((ticket) =>
            ticket.ticketName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(TicketsLoaded());
  }
}
