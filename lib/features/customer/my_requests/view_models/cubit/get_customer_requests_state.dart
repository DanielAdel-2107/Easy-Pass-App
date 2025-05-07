part of 'get_customer_requests_cubit.dart';

@immutable
sealed class GetCustomerRequestsState {}

final class GetCustomerRequestsInitial extends GetCustomerRequestsState {}
final class GetCustomerRequestsLoading extends GetCustomerRequestsState {}
final class GetCustomerRequestsSuccess extends GetCustomerRequestsState {}
final class GetCustomerRequestsFailed extends GetCustomerRequestsState {
  final String errorMessage;
  GetCustomerRequestsFailed({required this.errorMessage});
}
//
final class GetRequestsLoading extends GetCustomerRequestsState {}
final class GetRequestsSuccess extends GetCustomerRequestsState {
  final TicketModel ticketModel;

  GetRequestsSuccess({required this.ticketModel});
}
final class GetRequestsFailed extends GetCustomerRequestsState {
  final String errorMessage;
  GetRequestsFailed({required this.errorMessage});
}
//resell ticket
final class ResellTicketSuccess extends GetCustomerRequestsState {}
final class ResellTicketLoading extends GetCustomerRequestsState {}
final class ResellTicketFailed extends GetCustomerRequestsState {
  final String error;
  ResellTicketFailed({required this.error});
}
final class ResellTicketAlreadyExists extends GetCustomerRequestsState {}
