import 'package:flutter/foundation.dart';
import 'package:fmp/abstract_api_factory.dart';
import 'package:fmp/local/share_preference.dart';
import 'package:fmp/projects/model/project_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProjectApiImpl extends ProjectApi with AppPrefs {
  @override
  Future<List<Project>> getProjects() async {
    try {
      var url = "http://192.168.1.14:8000/api/projects";
      final accessToken = await getPrefAccessToken();
      http.Response response =
          await http.get(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken'
      });
      if (response.statusCode == 200) {
        return compute(parseProject, response.body);
      } else {
        throw Exception("Api Error - project failed");
      }
    } catch (e) {
      throw Exception("Api Error - server error");
    }
  }
}

List<Project> parseProject(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Project>((json) => Project.fromJson(json)).toList();
}
