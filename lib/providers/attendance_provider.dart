import 'package:flutter/material.dart';
import '../models.dart';

class AttendanceProvider with ChangeNotifier {
  final List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
  ];

  final List<AttendanceHistory> _history = [];

  List<Student> get students => _students;
  List<AttendanceHistory> get history => _history;

  void saveAttendance() {
    final presentCount = _students.where((s) => s.isPresent).length;
    final absentCount = _students.length - presentCount;

    _history.insert(0, AttendanceHistory(
      date: DateTime.now().toLocal().toString().split(' ')[0],
      presentCount: presentCount,
      absentCount: absentCount,
    ));

    for (var student in _students) {
      student.isPresent = false;
    }

    notifyListeners();
  }

  void togglePresence(int index, bool isPresent) {
    _students[index].isPresent = isPresent;
    notifyListeners();
  }
}
