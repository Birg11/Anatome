import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/medical_year.dart';

class CurriculumLoader {
  static Future<List<MedicalYear>> loadCurriculum() async {
    final data = await rootBundle.loadString('assets/data/medical_curriculum.json');
    final jsonData = json.decode(data);

    return (jsonData['years'] as List)
        .map((y) => MedicalYear.fromJson(y))
        .toList();
  }
}
