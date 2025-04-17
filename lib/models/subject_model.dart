import 'topic_model.dart';

class Subject {
  final String name;
  final List<Topic> topics;

  Subject({
    required this.name,
    required this.topics,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      name: json['name'],
      topics: (json['topics'] as List)
          .map((t) => Topic.fromJson(t))
          .toList(),
    );
  }
}
