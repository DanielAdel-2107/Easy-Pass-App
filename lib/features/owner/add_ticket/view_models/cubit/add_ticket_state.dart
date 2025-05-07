part of 'add_ticket_cubit.dart';

sealed class AddTicketState {}

final class AddTicketInitial extends AddTicketState {}
final class PickedImageSuccess extends AddTicketState {}
final class TimeUpdatedState extends AddTicketState {}
final class SelectDateSuccess extends AddTicketState {}
// add ticket state
final class AddTicketLoading extends AddTicketState {}
final class AddTicketSuccess extends AddTicketState {}
final class AddTicketFailure extends AddTicketState {
  final String message;
  AddTicketFailure({required this.message});
}
final class AddTicketFiledsEmpty extends AddTicketState {}
final class GetAllCategoryLoading extends AddTicketState {}
final class GetAllCategorySuccess extends AddTicketState {}
final class GetAllCategoryFailure extends AddTicketState {
  final String message;
  GetAllCategoryFailure({required this.message});
}
