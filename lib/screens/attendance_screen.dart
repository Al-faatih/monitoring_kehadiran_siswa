import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: attendanceProvider.students.length,
              itemBuilder: (context, index) {
                final student = attendanceProvider.students[index];
                return ListTile(
                  title: Text(student.name),
                  trailing: Checkbox(
                    value: student.isPresent,
                    onChanged: (_) => attendanceProvider.toggleAttendance(index),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: attendanceProvider.students.any((s) => s.isPresent)
                ? attendanceProvider.saveAttendance
                : null,
            child: Text('Simpan Kehadiran'),
          ),
        ],
      ),
    );
  }
}
