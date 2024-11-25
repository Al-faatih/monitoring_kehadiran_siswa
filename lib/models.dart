class Student {
  String name;
  bool isPresent;

  Student({required this.name, this.isPresent = false});
}

class AttendanceHistory {
  String date;
  int presentCount;
  int absentCount;

  AttendanceHistory({
    required this.date,
    required this.presentCount,
    required this.absentCount,
  });
}
