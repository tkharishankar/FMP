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
              padding: const EdgeInsets.all(8),
              itemCount: projects?.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 100,
                  child: Center(child: Text('${projects?[index].title}')),
                );
              },
            );
          }
        });
  }
}
