part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class Failed_auth extends AuthState {}

class Success_auth extends AuthState {}
