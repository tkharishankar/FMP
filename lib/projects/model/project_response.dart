class Project {
  Project({
    this.id,
    this.title,
    this.description,
    this.created,
    this.owner,
  });

  String? id;
  String? title;
  String? description;
  DateTime? created;
  String? owner;

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    created = json['created'];
    owner = json['owner'];
  }
}
