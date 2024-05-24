class THarvestingPlanSchema {
  dynamic harvestingPlanId;
  String? harvestingPlanDate;
  String? harvestingPlanEstateCode;
  String? harvestingPlanDivisionCode;
  String? harvestingPlanBlockCode;
  dynamic harvestingPlanTotalHk;
  String? harvestingPlanHectarage;
  String? harvestingPlanAssistantEmployeeCode;
  String? harvestingPlanAssistantEmployeeName;
  dynamic isApproved;
  String? harvestingPlanApprovedBy;
  String? harvestingPlanApprovedByName;
  String? harvestingPlanApprovedDate;
  String? harvestingPlanApprovedTime;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;

  THarvestingPlanSchema(
      {this.harvestingPlanId,
      this.harvestingPlanDate,
      this.harvestingPlanEstateCode,
      this.harvestingPlanDivisionCode,
      this.harvestingPlanBlockCode,
      this.harvestingPlanTotalHk,
      this.harvestingPlanHectarage,
      this.harvestingPlanAssistantEmployeeCode,
      this.harvestingPlanAssistantEmployeeName,
      this.isApproved,
      this.harvestingPlanApprovedBy,
      this.harvestingPlanApprovedByName,
      this.harvestingPlanApprovedDate,
      this.harvestingPlanApprovedTime,
      this.createdBy,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime});

  THarvestingPlanSchema.fromJson(Map<String, dynamic> json) {
    harvestingPlanId = json['harvesting_plan_id'];
    harvestingPlanDate = json['harvesting_plan_date'];
    harvestingPlanEstateCode = json['harvesting_plan_estate_code'];
    harvestingPlanDivisionCode = json['harvesting_plan_division_code'];
    harvestingPlanBlockCode = json['harvesting_plan_block_code'];
    harvestingPlanTotalHk = json['harvesting_plan_total_hk'];
    harvestingPlanHectarage = json['harvesting_plan_hectarage'];
    harvestingPlanAssistantEmployeeCode =
        json['harvesting_plan_assistant_employee_code'];
    harvestingPlanAssistantEmployeeName =
        json['harvesting_plan_assistant_employee_name'];
    isApproved = json['is_approved'];
    harvestingPlanApprovedBy = json['harvesting_plan_approved_by'];
    harvestingPlanApprovedByName = json['harvesting_plan_approved_by_name'];
    harvestingPlanApprovedDate = json['harvesting_plan_approved_date'];
    harvestingPlanApprovedTime = json['harvesting_plan_approved_time'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['harvesting_plan_id'] = harvestingPlanId;
    data['harvesting_plan_date'] = harvestingPlanDate;
    data['harvesting_plan_estate_code'] = harvestingPlanEstateCode;
    data['harvesting_plan_division_code'] = harvestingPlanDivisionCode;
    data['harvesting_plan_block_code'] = harvestingPlanBlockCode;
    data['harvesting_plan_total_hk'] = harvestingPlanTotalHk;
    data['harvesting_plan_hectarage'] = harvestingPlanHectarage;
    data['harvesting_plan_assistant_employee_code'] =
        harvestingPlanAssistantEmployeeCode;
    data['harvesting_plan_assistant_employee_name'] =
        harvestingPlanAssistantEmployeeName;
    data['is_approved'] = isApproved;
    data['harvesting_plan_approved_by'] = harvestingPlanApprovedBy;
    data['harvesting_plan_approved_by_name'] = harvestingPlanApprovedByName;
    data['harvesting_plan_approved_date'] = harvestingPlanApprovedDate;
    data['harvesting_plan_approved_time'] = harvestingPlanApprovedTime;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    return data;
  }
}
