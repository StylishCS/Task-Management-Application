import 'dart:developer';

import 'package:dio/dio.dart';

class WebService {
  static Dio dio = Dio();

  static Future loginRequest({required email, required password}) async {
    try {
      final response = await dio.post(
        "${ApiManager.baseUrl}/users/login",
        data: {"email": email, "password": password},
      );
      log(response.data.toString());
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  static Future signupRequest(
      {required name, required email, required password}) async {
    try {
      final response = await dio.post(
        "${ApiManager.baseUrl}/users/signup",
        data: {"name": name, "email": email, "password": password},
      );
      log(response.data.toString());
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }

  static Future pingRequest() async {
    try {
      final response = await dio.get(
        ApiManager.baseUrl,
      );
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
}

class ApiManager {
  static String baseUrl = "http://192.168.56.1:3000";
}
