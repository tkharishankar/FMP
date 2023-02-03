import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fmp/abstract_api_factory.dart';
import 'package:fmp/local/share_preference.dart';
import 'package:http/http.dart' as http;

import 'model/login_request.dart';
import 'model/login_response.dart';

class LoginApi extends ApiFactory with AppPrefs {
  @override
  Future<LoginResp> getAccessToken(LoginReq loginReq) async {
    try {
      var url = "http://10.39.1.83:8000/api/users/token/";
      http.Response response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(loginReq));
      if (response.statusCode == 200) {
        return LoginResp.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Api Error - login failed");
      }
    } catch (e) {
      if (kDebugMode) {
        throw Exception("Api Error - server error");
      }
    }
    throw Exception("Api Error - No internet");
  }
}
