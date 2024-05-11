import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseUrl = 'https://projects-management-system.onrender.com/api/v1';
  late Response response;
}