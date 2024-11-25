import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendanceProvider with ChangeNotifier {
  // Daftar siswa awal
  List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
  ];

  List<Student> get students => _students;

  // Riwayat kehadiran
  List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get history => _history;

  // Update kehadiran
  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }

  // Simpan kehadiran dan reset status
  void saveAttendance() {
    final presentCount = _students.where((s) => s.isPresent).length;
    final absentCount = _students.length - presentCount;

    _history.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    for (var student in _students) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
