class TAttendanceSchema {
  String? attendanceMandorEmployeeCode;
  String? attendanceMandorEmployeeName;
  String? attendanceEmployeeCode;
  String? attendanceEmployeeName;
  String? attendanceKeraniEmployeeCode;
  String? attendanceKeraniEmployeeName;
  dynamic attendanceId;
  String? attendanceDate;
  String? attendanceCode;
  String? attendanceDesc;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;

  TAttendanceSchema(
      {this.attendanceMandorEmployeeCode,
      this.attendanceMandorEmployeeName,
      this.attendanceEmployeeCode,
      this.attendanceEmployeeName,
      this.attendanceKeraniEmployeeCode,
      this.attendanceKeraniEmployeeName,
      this.attendanceId,
      this.attendanceDate,
      this.attendanceCode,
      this.attendanceDesc,
      this.createdBy,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime});

  TAttendanceSchema.fromJson(Map<String, dynamic> json) {
    attendanceMandorEmployeeCode = json['attendance_mandor_employee_code'];
    attendanceMandorEmployeeName = json['attendance_mandor_employee_name'];
    attendanceEmployeeCode = json['attendance_employee_code'];
    attendanceEmployeeName = json['attendance_employee_name'];
    attendanceKeraniEmployeeCode = json['attendance_kerani_employee_code'];
    attendanceKeraniEmployeeName = json['attendance_kerani_employee_name'];
    attendanceId = json['attendance_id'];
    attendanceDate = json['attendance_date'];
    attendanceCode = json['attendance_code'];
    attendanceDesc = json['attendance_desc'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attendance_mandor_employee_code'] = attendanceMandorEmployeeCode;
    data['attendance_mandor_employee_name'] = attendanceMandorEmployeeName;
    data['attendance_employee_code'] = attendanceEmployeeCode;
    data['attendance_employee_name'] = attendanceEmployeeName;
    data['attendance_kerani_employee_code'] = attendanceKeraniEmployeeCode;
    data['attendance_kerani_employee_name'] = attendanceKeraniEmployeeName;
    data['attendance_id'] = attendanceId;
    data['attendance_date'] = attendanceDate;
    data['attendance_code'] = attendanceCode;
    data['attendance_desc'] = attendanceDesc;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    return data;
  }
}
