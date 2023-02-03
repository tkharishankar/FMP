import 'package:flutter/foundation.dart';
import 'package:fmp/abstract_api_factory.dart';
import 'package:fmp/local/share_preference.dart';

import 'model/login_request.dart';
import 'model/login_response.dart';

class LoginViewmodel with AppPrefs {
  LoginApi? loginApi;
  LoginViewmodel({this.loginApi});

  Future<LoginResp?> getAccessToken(String username, String password) async {
    LoginReq loginReq = LoginReq(username: username, password: password);
    var result = await loginApi?.getAccessToken(loginReq);
    if (result?.access != null) {
      setPrefAccessToken(result?.access ?? '');
    }
    return result;
  }
}
