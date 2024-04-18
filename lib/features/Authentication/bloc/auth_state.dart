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