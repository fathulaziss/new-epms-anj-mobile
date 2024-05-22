import 'materials.dart';

class TWorkplanSchema {
  String? workplanId;
  String? workplanDate;
  String? workplanEstateCode;
  String? workplanDivisionCode;
  String? workplanActivityCode;
  String? workplanActivityName;
  String? workplanActivityUom;
  dynamic workplanTarget;
  int? workplanTotalHk;
  String? workplanRemark;
  String? workplanAssistantEmployeeCode;
  String? workplanAssistantEmployeeName;
  String? workplanBlockCode;
  String? workplanOrderNumber;
  String? workplanAucNumber;
  String? workplanCostCenter;
  dynamic isApproved;
  String? workplanApprovedBy;
  String? workplanApprovedByName;
  String? workplanApprovedDate;
  String? workplanApprovedTime;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;
  List<Materials>? materials;

  TWorkplanSchema({
    this.workplanId,
    this.workplanDate,
    this.workplanEstateCode,
    this.workplanDivisionCode,
    this.workplanActivityCode,
    this.workplanActivityName,
    this.workplanActivityUom,
    this.workplanTarget,
    this.workplanTotalHk,
    this.workplanRemark,
    this.workplanAssistantEmployeeCode,
    this.workplanAssistantEmployeeName,
    this.workplanBlockCode,
    this.workplanOrderNumber,
    this.workplanAucNumber,
    this.workplanCostCenter,
    this.isApproved,
    this.workplanApprovedBy,
    this.workplanApprovedByName,
    this.workplanApprovedDate,
    this.workplanApprovedTime,
    this.createdBy,
    this.createdDate,
    this.createdTime,
    this.updatedBy,
    this.updatedDate,
    this.updatedTime,
    this.materials,
  });

  TWorkplanSchema.fromJson(Map<String, dynamic> json) {
    workplanId = json['workplan_id'];
    workplanDate = json['workplan_date'];
    workplanEstateCode = json['workplan_estate_code'];
    workplanDivisionCode = json['workplan_division_code'];
    workplanActivityCode = json['workplan_activity_code'];
    workplanActivityName = json['workplan_activity_name'];
    workplanActivityUom = json['workplan_activity_uom'];
    workplanTarget = json['workplan_target'];
    workplanTotalHk = json['workplan_total_hk'];
    workplanRemark = json['workplan_remark'];
    workplanAssistantEmployeeCode = json['workplan_assistant_employee_code'];
    workplanAssistantEmployeeName = json['workplan_assistant_employee_name'];
    workplanBlockCode = json['workplan_block_code'];
    workplanOrderNumber = json['workplan_order_number'];
    workplanAucNumber = json['workplan_auc_number'];
    workplanCostCenter = json['workplan_cost_center'];
    isApproved = json['is_approved'];
    workplanApprovedBy = json['workplan_approved_by'];
    workplanApprovedByName = json['workplan_approved_by_name'];
    workplanApprovedDate = json['workplan_approved_date'];
    workplanApprovedTime = json['workplan_approved_time'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
    if (json['materials'] != null) {
      materials = <Materials>[];
      json['materials'].forEach((v) {
        materials!.add(Materials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['workplan_id'] = workplanId;
    data['workplan_date'] = workplanDate;
    data['workplan_estate_code'] = workplanEstateCode;
    data['workplan_division_code'] = workplanDivisionCode;
    data['workplan_activity_code'] = workplanActivityCode;
    data['workplan_activity_name'] = workplanActivityName;
    data['workplan_activity_uom'] = workplanActivityUom;
    data['workplan_target'] = workplanTarget;
    data['workplan_total_hk'] = workplanTotalHk;
    data['workplan_remark'] = workplanRemark;
    data['workplan_assistant_employee_code'] = workplanAssistantEmployeeCode;
    data['workplan_assistant_employee_name'] = workplanAssistantEmployeeName;
    data['workplan_block_code'] = workplanBlockCode;
    data['workplan_order_number'] = workplanOrderNumber;
    data['workplan_auc_number'] = workplanAucNumber;
    data['workplan_cost_center'] = workplanCostCenter;
    data['is_approved'] = isApproved;
    data['workplan_approved_by'] = workplanApprovedBy;
    data['workplan_approved_by_name'] = workplanApprovedByName;
    data['workplan_approved_date'] = workplanApprovedDate;
    data['workplan_approved_time'] = workplanApprovedTime;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    if (materials != null) {
      data['materials'] = materials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
