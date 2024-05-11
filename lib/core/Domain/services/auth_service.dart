import 'package:dio/dio.dart';
import 'package:managementp_projects/core/Domain/Model/AuthModel/LoginModel.dart';
import 'package:managementp_projects/core/Domain/Model/AuthModel/SignUpModel.dart';
import 'package:managementp_projects/core/Domain/services/base_servive.dart';
import 'package:managementp_projects/core/config/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices extends BaseService {
  Sign_Up_post(SignUpModel auth) async {
    Dio dio = Dio();
    Response response = await dio.post(
      '${baseUrl}/auth/register',
      data: auth.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          "X-Requested-With": "accept: */*"
        },
      ),
    );

    if (response.statusCode == 200) {
      config
          .get<SharedPreferences>()
          .setString('token', response.data['token']);

      print(config.get<SharedPreferences>().getString('token'));
      print(response.data);
    } else {
      print('error');
    }
  }

  Login_post(LoginModel login) async {
    Dio dio = Dio();
    Response response = await dio.post(
      '${baseUrl}/auth/authenticate',
      data: login.toJson(),
      options: Options(
        headers: {
          "Authorization":"Bearer ${config.get<SharedPreferences>().getString('token')}"
        },
      ),
    );

    if (response.statusCode == 200) {
      // config
      //     .get<SharedPreferences>()
      //     .setString('token', response.data['token']);

      print(response.data);
    } else {
      print('error');
    }
  }
}
