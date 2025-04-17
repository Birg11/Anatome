import 'quiz_question.dart';

class Topic {
  final String title;
  final String description;
  final String notes;
  final List<QuizQuestion> questions;

  Topic({
    required this.title,
    required this.description,
    required this.notes,
    required this.questions,
  });

factory Topic.fromJson(Map<String, dynamic> json) {
  return Topic(
    title: json['title'],
    description: json['description'],
    notes: json['notes'],
    questions: (json['questions'] as List<dynamic>? ?? [])
        .map((q) => QuizQuestion.fromJson(q))
        .toList(),
  );
}

}
