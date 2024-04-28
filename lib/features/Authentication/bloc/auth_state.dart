part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginInProgress extends AuthState {}

final class LoginSuccess extends AuthState {
  

  const LoginSuccess();

  @override
  List<Object> get props => [];
}

final class LoginFailure extends AuthState {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class SignUpInProgress extends AuthState {}

final class SignUpSuccess extends AuthState {
  

  const SignUpSuccess();

  @override
  List<Object> get props => [];
}

final class SignUpFailure extends AuthState {
  final String errorMessage;

  const SignUpFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class VerifyEmail extends AuthState {}

final class VerifyEmailSuccess extends AuthState {
  

  const VerifyEmailSuccess();

  @override
  List<Object> get props => [];
}

final class VerifyEmailFailure extends AuthState {
  final String errorMessage;

  const VerifyEmailFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class ResendVerificationEmailInProgress extends AuthState {}

final class ResendVerificationEmailSuccess extends AuthState {
  

  const ResendVerificationEmailSuccess();

  @override
  List<Object> get props => [];
}

final class ResendVerificationEmailFailure extends AuthState {
  final String errorMessage;

  const ResendVerificationEmailFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

