class CoursesModel {
  CoursesModel({
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
  final List<String> modules;
  final List subscribers;

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      id: json['_id'],
      title: json['title'],
      creator: json['creator'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      modules: (json['modules'] as List).cast<String>(),
      subscribers: json['subscribers'],
    );
  }
}
