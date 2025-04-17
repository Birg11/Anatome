import 'package:anatome/models/quiz_loader.dart';
import 'package:anatome/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import '../models/medical_year.dart';
import '../utils/curriculum_loader.dart';
import 'subject_selector_screen.dart';

class YearSelectorScreen extends StatefulWidget {
  const YearSelectorScreen({super.key});

  @override
  State<YearSelectorScreen> createState() => _YearSelectorScreenState();
}

class _YearSelectorScreenState extends State<YearSelectorScreen> {
  List<MedicalYear> _years = [];

  @override
  void initState() {
    super.initState();
    loadCurriculum();
  }

  Future<void> loadCurriculum() async {
    final loaded = await CurriculumLoader.loadCurriculum();
    setState(() {
      _years = loaded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Academic Year'),
        backgroundColor: Colors.teal[800],
      ),
      body: _years.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : 
        ListView.separated(
  padding: const EdgeInsets.all(16),
  itemCount: _years.length,
  separatorBuilder: (_, __) => const SizedBox(height: 16),
  itemBuilder: (context, index) {
    final year = _years[index];
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: Colors.teal[100 * ((index + 2) % 9)],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.school, color: Colors.teal, size: 28),
              title: Text(
                'Year ${year.year}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubjectSelectorScreen(year: year),
                  ),
                );
              },
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: TextButton.icon(
            //     onPressed: () async {
            //       final questions =
            //           await QuizLoader.loadRandomByYear(year: year.year);

            //       if (questions.isEmpty) {
            //         ScaffoldMessenger.of(context).showSnackBar(
            //           const SnackBar(
            //               content: Text("No questions found for this year.")),
            //         );
            //         return;
            //       }

            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (_) => QuizScreen(
            //             category: 'Year ${year.year} (Random)',
            //             questions: questions,
            //           ),
            //         ),
            //       );
            //     },
            //     icon: const Icon(Icons.shuffle),
            //     label: const Text("Random Quiz"),
            //   ),
            // )
          ],
        ),
      ),
    );
  },
)
    );
  }
}
