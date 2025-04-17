import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/quiz_question.dart';

class QuizLoader {
  static Future<List<QuizQuestion>> loadQuiz(String subject, String topic) async {
    final String jsonString = await rootBundle.loadString('assets/data/quizzes.json');
    final List<dynamic> data = jsonDecode(jsonString);

    final entry = data.firstWhere(
      (e) => e['subject'] == subject && e['topic'] == topic,
      orElse: () => null,
    );

    if (entry == null || entry['questions'] == null) return [];

    return (entry['questions'] as List)
        .map((q) => QuizQuestion.fromJson(q))
        .toList();
  }

  static Future<List<QuizQuestion>> loadRandomByYear({
    required int year,
    int limit = 15,
  }) async {
    final String quizJson = await rootBundle.loadString('assets/data/quizzes.json');
    final List<dynamic> quizData = jsonDecode(quizJson);

    final String curriculumJson = await rootBundle.loadString('assets/data/medical_curriculum.json');
    final List<dynamic> curriculumData = jsonDecode(curriculumJson);

    final currentYear = curriculumData.firstWhere(
      (y) => y['year'] == year,
      orElse: () => null,
    );

    if (currentYear == null) return [];

    final List<String> topics = [];
    for (final subject in currentYear['subjects']) {
      for (final topic in subject['topics']) {
        topics.add(topic['title']);
      }
    }

    final all = quizData
        .where((entry) => topics.contains(entry['topic']))
        .expand((entry) => (entry['questions'] ?? []))
        .map((q) => QuizQuestion.fromJson(q))
        .toList();

    all.shuffle();
    return all.take(limit).toList();
  }
}
Future<List<QuizQuestion>> loadAllQuestions() async {
  final String quizJson = await rootBundle.loadString('assets/data/quizzes.json');
  final List<dynamic> quizData = jsonDecode(quizJson);

  final all = quizData
      .expand((entry) => (entry['questions'] ?? []))
      .map((q) => QuizQuestion.fromJson(q))
      .toList();

  all.shuffle();
  return all;
}

