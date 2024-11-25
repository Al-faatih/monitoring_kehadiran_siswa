import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: attendanceProvider.history.length,
        itemBuilder: (context, index) {
          final record = attendanceProvider.history[index];
          return ListTile(
            title: Text(
              '${record['date'].toString().split(' ')[0]}',
            ),
            subtitle: Text(
              'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
            ),
          );
        },
      ),
    );
  }
}
