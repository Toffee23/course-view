class CourseModel {
  CourseModel({
    required this.id,
    required this.title,
    required this.creator,
    required this.description,
    required this.thumbnail,
    required this.modules,
    required this.subscribers,
  });
  final String id;
  final String title;
  final String creator;
  final String description;
  final String thumbnail;
  final List<Module> modules;
  final List subscribers;

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['_id'],
      title: json['title'],
      creator: json['creator'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      modules: json['modules'].map<Module>((e) => Module.fromJson(e)).toList(),
      subscribers: json['subscribers'],
    );
  }
}

class Module {
  Module({
    required this.id,
    required this.name,
    required this.url,
    required this.subscriptionRequired,
  });
  final String id;
  final String name;
  final String url;
  final bool subscriptionRequired;

  factory Module.fromJson(Map<String, dynamic> json) {
    print('ODUN $json');
    return Module(
      id: json['_id'],
      name: json['module_name'],
      url: json['firebase_id'],
      subscriptionRequired: json['subscriptionRequired'],
    );
  }
}
