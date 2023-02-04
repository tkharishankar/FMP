class Project {
  String? id;
  String? title;
  String? description;
  String? created;
  String? owner;

  Project({this.id, this.title, this.description, this.created, this.owner});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    created = json['created'];
    owner = json[''];
  }
}
