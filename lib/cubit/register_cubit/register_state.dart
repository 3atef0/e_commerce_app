part of 'register_cubit.dart';

abstract class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

class SignUpSuccessful extends RegisterCubitState {
  final RegisterModel user;
  SignUpSuccessful(this.user);
}

class SignUpFailure extends RegisterCubitState {
  final String error;
  SignUpFailure(this.error);
}

class SignUpLoading extends RegisterCubitState {}
