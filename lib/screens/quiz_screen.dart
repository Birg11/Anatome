import 'package:flutter/material.dart';
import '../models/quiz_question.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final List<QuizQuestion> questions;

  const QuizScreen({
    super.key,
    required this.category,
    required this.questions,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<QuizQuestion> questions;
  int currentIndex = 0;
  int score = 0;
  bool isAnswered = false;
  int? selectedOption;

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
  }

  void handleAnswer(int index) {
    if (isAnswered) return;

    setState(() {
      selectedOption = index;
      isAnswered = true;
      if (index == questions[currentIndex].correctIndex) {
        score++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      currentIndex++;
      isAnswered = false;
      selectedOption = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= questions.length) {
      return Scaffold(
        body: Center(
          child: Text(
            'Quiz Complete!\nScore: $score/${questions.length}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      );
    }

    final q = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('${widget.category} Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Q${currentIndex + 1}: ${q.question}',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 24),
            ...List.generate(q.options.length, (i) {
              final isCorrect = i == q.correctIndex;
              final isSelected = i == selectedOption;

              Color? color;
              if (isAnswered) {
                if (isSelected && isCorrect) {
                  color = Colors.green;
                } else if (isSelected && !isCorrect) {
                  color = Colors.red;
                } else if (isCorrect) {
                  color = Colors.green.withOpacity(0.5);
                }
              }

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () => handleAnswer(i),
                  child: Text(q.options[i]),
                ),
              );
            }),
            const Spacer(),
            if (isAnswered)
              Center(
                child: ElevatedButton(
                  onPressed: nextQuestion,
                  child: const Text('Next'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
