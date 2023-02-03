import 'dart:async';

import 'package:fmp/abstract_api_factory.dart';
import 'package:fmp/projects/model/project_response.dart';

class ProjectViewmodel {
  ProjectApi? projectApi;
  ProjectViewmodel({this.projectApi});

  Future<List<Project>?> getProject() async {
    var result = await projectApi?.getProjects();
    return result;
  }
}
