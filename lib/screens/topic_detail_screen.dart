import 'package:anatome/models/quiz_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../models/topic_model.dart';
import '../models/subject_model.dart';
import 'quiz_screen.dart';

class TopicDetailScreen extends StatelessWidget {
  final Topic topic;
  final Subject subject;

  const TopicDetailScreen({
    super.key,
    required this.topic,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
        backgroundColor: Colors.teal[800],
        actions: [
//           IconButton(
//             icon: const Icon(Icons.quiz),
//             tooltip: 'Start Quiz',
//        onPressed: () async {
//   final questions = await QuizLoader.loadQuiz(subject.name, topic.title);
//   if (questions.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("No quiz available for this topic")),
//     );
//     return;
//   }
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (_) => QuizScreen(category: subject.name, questions: questions),
//     ),
//   );
// },

//           ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topic.description,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Markdown(
                data: topic.notes,
                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                  h1: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  p: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
