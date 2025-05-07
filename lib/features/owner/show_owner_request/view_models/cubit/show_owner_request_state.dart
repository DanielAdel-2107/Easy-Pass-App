part of 'show_owner_request_cubit.dart';

@immutable
sealed class ShowOwnerRequestState {}

final class ShowOwnerRequestInitial extends ShowOwnerRequestState {}

final class ShowOwnerRequestLoading extends ShowOwnerRequestState {}

final class ShowOwnerRequestSuccess extends ShowOwnerRequestState {}

final class ShowOwnerRequestFailed extends ShowOwnerRequestState {
  final String message;
  ShowOwnerRequestFailed({required this.message});
}

//
final class ShowRequestLoading extends ShowOwnerRequestState {}

final class ShowRequestSuccess extends ShowOwnerRequestState {
  final TicketModel ticketModel;

  ShowRequestSuccess({required this.ticketModel});
}

final class ShowRequestFailed extends ShowOwnerRequestState {
  final String message;
  ShowRequestFailed({required this.message});
}
//
final class OpenChatLoading extends ShowOwnerRequestState {}

final class OpenChatSuccess extends ShowOwnerRequestState {
  final String messageId;

  OpenChatSuccess({required this.messageId});
}

final class OpenChatFailed extends ShowOwnerRequestState {
  final String message;
  OpenChatFailed({required this.message});
}
//
final class RejectRequestLoading extends ShowOwnerRequestState {}

final class RejectRequesSuccess extends ShowOwnerRequestState {
}

final class RejectRequesFailed extends ShowOwnerRequestState {
  final String message;
  RejectRequesFailed({required this.message});
}
//
final class AcceptRequestLoading extends ShowOwnerRequestState {}

final class AcceptRequestSuccess extends ShowOwnerRequestState {
}

final class AcceptRequestFailed extends ShowOwnerRequestState {
  final String message;
  AcceptRequestFailed({required this.message});
}
