// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class SPBLoader extends Equatable {
  String? spbId;
  String? spbLoaderId;
  int? loaderType;
  int? loaderDestinationType;
  String? loaderEmployeeCode;
  String? loaderEmployeeName;
  int? loaderPercentage;

  SPBLoader(
      {this.spbId,
      this.spbLoaderId,
      this.loaderType,
      this.loaderDestinationType,
      this.loaderEmployeeCode,
      this.loaderEmployeeName,
      this.loaderPercentage});

  SPBLoader.fromJson(Map<String, dynamic> json) {
    spbId = json['spb_id'];
    spbLoaderId = json['spb_loader_id'];
    loaderType = json['loader_type'];
    loaderDestinationType = json['loader_destination_type'];
    loaderEmployeeCode = json['loader_employee_code'];
    loaderEmployeeName = json['loader_employee_name'];
    loaderPercentage = json['loader_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spb_id'] = spbId;
    data['spb_loader_id'] = spbLoaderId;
    data['loader_type'] = loaderType;
    data['loader_destination_type'] = loaderDestinationType;
    data['loader_employee_code'] = loaderEmployeeCode;
    data['loader_employee_name'] = loaderEmployeeName;
    data['loader_percentage'] = loaderPercentage;
    return data;
  }

  @override
  List<Object?> get props => [spbId, spbLoaderId];
}
