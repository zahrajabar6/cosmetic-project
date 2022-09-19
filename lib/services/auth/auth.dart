import 'dart:convert';

import 'package:dio/dio.dart';

class AuthService {
  static signin({required String email, required String password}) async {
    Response response = await Dio()
        .post('http://127.0.0.1:8000/api/docs#/auth/Account_views_signin');
    data:
    jsonEncode({
      "email": "user1@example.com",
      "password": "string",
    });
    print(response);
  }
}
