part of 'sign_in_cubit.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {
  final String routeName;

  SignInSuccess({required this.routeName});
}

class SignInLoading extends SignInState {}

class SignInFailure extends SignInState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}
