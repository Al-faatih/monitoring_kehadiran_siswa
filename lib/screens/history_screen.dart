import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/attendance_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: provider.history.length,
        itemBuilder: (context, index) {
          final history = provider.history[index];
          return ListTile(
            title: Text(history.date),
            subtitle: Text(
                'Hadir: ${history.presentCount}, Tidak Hadir: ${history.absentCount}'),
          );
        },
      ),
    );
  }
}
