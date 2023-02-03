import 'package:fmp/abstract_api_factory.dart';
import 'package:fmp/local/share_preference.dart';

import 'model/login_request.dart';
import 'model/login_response.dart';

class LoginViewmodel with AppPrefs {
  ApiFactory? apiFactory;
  LoginViewmodel({this.apiFactory});

  Future<LoginResp> getAccessToken(LoginReq loginReq) async {
    var result = await apiFactory!.getAccessToken(loginReq);
    if (result.access!.isNotEmpty) {
      setPrefAccessToken(result.access!);
    }
    return result;
  }
}
