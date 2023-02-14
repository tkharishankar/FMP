import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fmp/abstract_api_factory.dart';
import 'package:fmp/projects/model/project_response.dart';

class ProjectViewmodel {
  ProjectApi? projectApi;
  ProjectViewmodel({this.projectApi});

  Future<List<Project>?> getProject() async {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (kDebugMode) {
        print("object");
      }
    });
    var result = await projectApi?.getProjects();
    return result;
  }
}
