part of 'book_cubit.dart';

@immutable
sealed class BookState {}

//! book state
final class BookInitial extends BookState {}

final class BookSuccess extends BookState {}

final class BookFailed extends BookState {
  final String error;
  BookFailed({required this.error});
}
final class TicketAlreadyBooked extends BookState {}

final class BookLoading extends BookState {}

//! chat state
final class OpenChatSuccess extends BookState {}

final class OpenChatFailed extends BookState {
  final String error;
  OpenChatFailed({required this.error});
}

final class OpenChatLoading extends BookState {}
//resell ticket
final class ResellTicketSuccess extends BookState {}
final class ResellTicketLoading extends BookState {}
final class ResellTicketFailed extends BookState {
  final String error;
  ResellTicketFailed({required this.error});
}
final class ThisIsMyTicket extends BookState {}
final class SuspendTicket extends BookState {}
