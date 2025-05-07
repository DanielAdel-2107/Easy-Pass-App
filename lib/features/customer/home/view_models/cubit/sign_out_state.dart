part of 'sign_out_cubit.dart';

@immutable
sealed class SignOutState {}

final class SignOutInitial extends SignOutState {}

final class SignOutSuccess extends SignOutState {}

final class SignOutFailed extends SignOutState {
  final String message;

  SignOutFailed({required this.message});
}

final class SignOutLoading extends SignOutState {}
