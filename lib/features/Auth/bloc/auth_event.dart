part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegisterData extends AuthEvent {
  String first_name;
  String last_name;
  String email;
  String password;
  RegisterData({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
  });
}

class LoginData extends AuthEvent {
  String email;
  String password;
  LoginData({
    required this.email,
    required this.password,
  });
}
