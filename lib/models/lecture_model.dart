class LectureModel {
  final String course;
  final String lecturer;
  final String department;
  final String room;
  final String date;
  final String time;

  LectureModel({
    required this.course,
    required this.lecturer,
    required this.department,
    required this.room,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'course': course,
      'lecturer': lecturer,
      'department': department,
      'room': room,
      'date': date,
      'time': time,
    };
  }

  factory LectureModel.fromMap(Map<String, dynamic> map) {
    return LectureModel(
      course: map['course'],
      lecturer: map['lecturer'],
      department: map['department'],
      room: map['room'],
      date: map['date'],
      time: map['time'],
    );
  }
}
