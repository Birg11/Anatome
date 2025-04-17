import 'package:flutter/material.dart';
import '../models/medical_year.dart';
import '../models/subject_model.dart';
import 'topic_list_screen.dart';

class SubjectSelectorScreen extends StatelessWidget {
  final MedicalYear year;

  const SubjectSelectorScreen({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
    final subjects = year.subjects;

    return Scaffold(
      appBar: AppBar(
        title: Text('Year ${year.year} Subjects'),
        backgroundColor: Colors.teal[800],
      ),
      body: subjects.isEmpty
          ? const Center(child: Text('No subjects available'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: subjects.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final Subject subject = subjects[index];
                final topicCount = subject.topics.length;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TopicListScreen(subject: subject),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    color: Colors.teal[50 * ((index + 2) % 9)],
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 20),
                      leading: const Icon(Icons.book_outlined,
                          size: 30, color: Colors.teal),
                      title: Text(
                        subject.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('$topicCount topic(s)'),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
