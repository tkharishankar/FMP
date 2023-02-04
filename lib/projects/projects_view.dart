import 'package:flutter/material.dart';
import 'package:fmp/projects/projects_api.dart';
import 'package:fmp/projects/projects_viewmodel.dart';

import 'model/project_response.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  var projectViewmodel = ProjectViewmodel(projectApi: ProjectApiImpl());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Project>?>(
        future: projectViewmodel.getProject(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Project>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            var projects = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: projects?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.blue,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: Text(
                      projects![index].description!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  );
                });
          }
        });
  }
}
