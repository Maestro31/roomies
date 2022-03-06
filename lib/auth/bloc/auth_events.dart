part of './auth_bloc.dart';

abstract class AuthEvent {}

class AuthRegistrationSubmitted extends AuthEvent {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  AuthRegistrationSubmitted({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });
}

class AuthLoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  AuthLoginSubmitted({
    required this.email,
    required this.password,
  });
}

class AuthUserDisconnected extends AuthEvent {}
