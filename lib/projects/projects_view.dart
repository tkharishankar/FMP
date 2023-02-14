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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: projectListView(projectViewmodel),
      ),
    );
  }
}

projectListView(ProjectViewmodel projectViewmodel) {
  return FutureBuilder<List<Project>?>(
      future: projectViewmodel.getProject(),
      builder: (BuildContext context, AsyncSnapshot<List<Project>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 60.0,
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          var projects = snapshot.data;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: projects?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4, bottom: 4),
                  alignment: Alignment.center,
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text(projects![index].title.toString()),
                          subtitle:
                              Text(projects[index].description.toString()),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
      });
}
