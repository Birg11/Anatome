import 'package:anatome/models/quiz_loader.dart' as QuizLoader;
import 'package:anatome/screens/flashcard_screen.dart';
import 'package:flutter/material.dart';
import 'year_selector_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              'Anatome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Explore structured medical education by year, subject, or quiz.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.school),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent[700],
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const YearSelectorScreen()),
                );
              },
              label: const Text(
                'Browse by Academic Year',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
  icon: const Icon(Icons.flash_on),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
    minimumSize: const Size.fromHeight(50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  onPressed: () async {
    final questions = await QuizLoader.loadAllQuestions();
    if (questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No flashcards available.")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FlashcardScreen(questions: questions),
      ),
    );
  },
  label: const Text('Flashcard Mode'),
),

            // ElevatedButton.icon(
            //   icon: const Icon(Icons.search),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.white24,
            //     foregroundColor: Colors.white,
            //     minimumSize: const Size.fromHeight(50),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   onPressed: () {
            //     // TODO: Implement search or topic mode
            //   },
            //   label: const Text(
            //     'Quick Topic Search',
            //     style: TextStyle(fontSize: 18),
            //   ),
            // ),
            const Spacer(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Empowering Future Doctors 💡',
                style: TextStyle(color: Colors.white60),
              ),
            )
          ],
        ),
      ),
    );
  }
}
