import 'package:flutter/material.dart';
import '../models/subject_model.dart';
import 'topic_detail_screen.dart';
import 'quiz_screen.dart';

class TopicListScreen extends StatelessWidget {
  final Subject subject;

  const TopicListScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final topics = subject.topics;

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
        backgroundColor: Colors.teal[800],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final topic = topics[index];

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                topic.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  topic.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // trailing: IconButton(
              //   icon: const Icon(Icons.quiz, color: Colors.deepPurple),
              //   tooltip: 'Start Quiz',
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (_) => QuizScreen(
              //           category: subject.name,
              //           questions: topic.questions,
              //         ),
              //       ),
              //     );
              //   },
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TopicDetailScreen(
                      topic: topic,
                      subject: subject,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
