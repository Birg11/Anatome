import 'subject_model.dart';

class MedicalYear {
  final int year;
  final List<Subject> subjects;

  MedicalYear({
    required this.year,
    required this.subjects,
  });

  factory MedicalYear.fromJson(Map<String, dynamic> json) {
    return MedicalYear(
      year: json['year'],
      subjects: (json['subjects'] as List)
          .map((s) => Subject.fromJson(s))
          .toList(),
    );
  }
}
