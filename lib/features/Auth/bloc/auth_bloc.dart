import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:managementp_projects/core/Domain/Model/AuthModel/LoginModel.dart';
import 'package:managementp_projects/core/Domain/Model/AuthModel/SignUpModel.dart';
import 'package:managementp_projects/core/Domain/services/auth_service.dart';
import 'package:managementp_projects/core/config/get_it.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String baseUrl = "https://projects-management-system.onrender.com/api/v1";
  AuthBloc() : super(AuthInitial()) {
    on<RegisterData>((event, emit) async {
      emit(Loading());
      Dio dio = Dio();
      Response response = await dio.post(
        '${baseUrl}/auth/register',
        data: event.auth.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            "X-Requested-With": "accept: */*"
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(Success_auth());
        config
            .get<SharedPreferences>()
            .setString('token', response.data['token']);

        print(config.get<SharedPreferences>().getString('token'));
        print(response.data);
      } else {
        print('error');
        emit(Failed_auth());
      }
    });

    on<LoginData>((event, emit) async {
      emit(Loading());
      Dio dio = Dio();
      Response response = await dio.post(
        '${baseUrl}/auth/authenticate',
        data: event.login.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            "X-Requested-With": "accept: */*",
          "Authorization":"Bearer ${config.get<SharedPreferences>().getString('token')}",
      
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(Success_auth());
        config
            .get<SharedPreferences>()
            .setString('token', response.data['token']);

        print(config.get<SharedPreferences>().getString('token'));
        print(response.data);
      } else {
        print('error');
        emit(Failed_auth());
      }
    });
    
  }
  
}

