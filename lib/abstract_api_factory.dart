import 'login/model/login_request.dart';
import 'login/model/login_response.dart';
import 'projects/model/project_response.dart';

abstract class LoginApi {
  Future<LoginResp> getAccessToken(LoginReq loginReq);
}

abstract class ProjectApi {
  Future<List<Project>> getProjects();
}
