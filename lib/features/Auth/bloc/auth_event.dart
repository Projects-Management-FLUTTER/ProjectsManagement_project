// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegisterData extends AuthEvent {
  SignUpModel auth;
  RegisterData({
    required this.auth,
  });
}

class LoginData extends AuthEvent {
  LoginModel login;
  LoginData({
    required this.login,
  });
}
