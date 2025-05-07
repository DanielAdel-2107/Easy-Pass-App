part of 'my_tickets_cubit.dart';

@immutable
sealed class GetMyTicketsState {}

final class GetMyTicketsInitial extends GetMyTicketsState {}
final class GetMyTicketsSuccess extends GetMyTicketsState {}
final class GetMyTicketsLoading extends GetMyTicketsState {}
final class GetMyTicketsFailed extends GetMyTicketsState {
  final String message;
  GetMyTicketsFailed({required this.message});
}
//
final class ChangeStateSuccess extends GetMyTicketsState {}
final class ChangeStateLoading extends GetMyTicketsState {}
final class ChangeStateFailed extends GetMyTicketsState {
  final String message;
  ChangeStateFailed({required this.message});
}
