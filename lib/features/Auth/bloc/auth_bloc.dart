import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:managementp_projects/core/Domain/Model/AuthModel/LoginModel.dart';
import 'package:managementp_projects/core/Domain/Model/AuthModel/SignUpModel.dart';
import 'package:managementp_projects/core/Domain/services/auth_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterData>((event, emit) async{
      await AuthServices().Sign_Up_post(SignUpModel(
          firstName: event.first_name,
          lastName: event.last_name,
          email: event.email,
          password: event.password,
          role: 'USER'));
    });
  }
}
