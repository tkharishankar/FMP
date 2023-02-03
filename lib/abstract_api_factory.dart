import 'login/model/login_request.dart';
import 'login/model/login_response.dart';

abstract class ApiFactory {
  Future<LoginResp> getAccessToken(LoginReq loginReq);
}
