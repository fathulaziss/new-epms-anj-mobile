// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class MAttendanceSchema extends Equatable {
  dynamic attendanceId;
  String? attendanceCode;
  String? attendanceDesc;

  MAttendanceSchema(
      {this.attendanceId, this.attendanceCode, this.attendanceDesc});

  MAttendanceSchema.fromJson(Map<String, dynamic> json) {
    attendanceId = json['attendance_id'];
    attendanceCode = json['attendance_code'];
    attendanceDesc = json['attendance_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attendance_id'] = attendanceId;
    data['attendance_code'] = attendanceCode;
    data['attendance_desc'] = attendanceDesc;
    return data;
  }

  @override
  String toString() {
    return 'MAttendanceSchema(attendance_id : $attendanceId, attendance_code: $attendanceCode, attendance_desc: $attendanceDesc)';
  }

  @override
  List<Object> get props => [attendanceCode!, attendanceDesc!];

  @override
  bool get stringify => false;
}
