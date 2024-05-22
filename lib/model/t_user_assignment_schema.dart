class TUserAssignmentSchema {
  dynamic mandorId;
  String? estateCode;
  String? mandor1EmployeeCode;
  String? mandor1EmployeeName;
  String? keraniKirimEmployeeCode;
  String? keraniKirimEmployeeName;
  String? mandorEmployeeCode;
  String? mandorEmployeeName;
  String? keraniPanenEmployeeCode;
  String? keraniPanenEmployeeName;
  String? employeeCode;
  String? employeeName;
  String? startValidity;
  String? endValidity;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;

  TUserAssignmentSchema(
      {this.mandorId,
      this.estateCode,
      this.mandor1EmployeeCode,
      this.mandor1EmployeeName,
      this.keraniKirimEmployeeCode,
      this.keraniKirimEmployeeName,
      this.mandorEmployeeCode,
      this.mandorEmployeeName,
      this.keraniPanenEmployeeCode,
      this.keraniPanenEmployeeName,
      this.employeeCode,
      this.employeeName,
      this.startValidity,
      this.endValidity,
      this.createdBy,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime});

  TUserAssignmentSchema.fromJson(Map<String, dynamic> json) {
    mandorId = json['mandor_id'];
    estateCode = json['estate_code'];
    mandor1EmployeeCode = json['mandor1_employee_code'];
    mandor1EmployeeName = json['mandor1_employee_name'];
    keraniKirimEmployeeCode = json['kerani_kirim_employee_code'];
    keraniKirimEmployeeName = json['kerani_kirim_employee_name'];
    mandorEmployeeCode = json['mandor_employee_code'];
    mandorEmployeeName = json['mandor_employee_name'];
    keraniPanenEmployeeCode = json['kerani_panen_employee_code'];
    keraniPanenEmployeeName = json['kerani_panen_employee_name'];
    employeeCode = json['employee_code'];
    employeeName = json['employee_name'];
    startValidity = json['start_validity'];
    endValidity = json['end_validity'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mandor_id'] = mandorId;
    data['estate_code'] = estateCode;
    data['mandor1_employee_code'] = mandor1EmployeeCode;
    data['mandor1_employee_name'] = mandor1EmployeeName;
    data['kerani_kirim_employee_code'] = keraniKirimEmployeeCode;
    data['kerani_kirim_employee_name'] = keraniKirimEmployeeName;
    data['mandor_employee_code'] = mandorEmployeeCode;
    data['mandor_employee_name'] = mandorEmployeeName;
    data['kerani_panen_employee_code'] = keraniPanenEmployeeCode;
    data['kerani_panen_employee_name'] = keraniPanenEmployeeName;
    data['employee_code'] = employeeCode;
    data['employee_name'] = employeeName;
    data['start_validity'] = startValidity;
    data['end_validity'] = endValidity;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    return data;
  }
}
