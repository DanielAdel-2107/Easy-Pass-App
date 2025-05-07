part of 'get_all_tickets_cubit.dart';

sealed class GetAllTicketsState {}

final class GetAllTicketsInitial extends GetAllTicketsState {}

final class GetAllTicketsLoaded extends GetAllTicketsState {}

final class GetAllTicketsFailed extends GetAllTicketsState {
  final String errorMessage;

  GetAllTicketsFailed({required this.errorMessage});
}

final class GetAllTicketsLoading extends GetAllTicketsState {}
