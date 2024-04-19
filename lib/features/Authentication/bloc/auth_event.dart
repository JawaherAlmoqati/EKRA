part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

final class SignUpEvent extends AuthEvent {
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;

  const SignUpEvent({
    required this.fullName,
    required this.email,  
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object> get props => [email, password, fullName, phoneNumber];
}

final class GetCurrentUserEvent extends AuthEvent {
  const GetCurrentUserEvent();
}
