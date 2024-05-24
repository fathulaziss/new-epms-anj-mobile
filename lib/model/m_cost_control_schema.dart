class MCostControlSchema {
  int? costControlId;
  int? activityCodeStart;
  int? activityCodeEnd;
  int? costByBlock;
  int? costByAuc;
  int? costByOrderNumber;
  int? costByCostCenter;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;

  MCostControlSchema(
      {this.costControlId,
      this.activityCodeStart,
      this.activityCodeEnd,
      this.costByBlock,
      this.costByAuc,
      this.costByOrderNumber,
      this.costByCostCenter,
      this.createdBy,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime});

  MCostControlSchema.fromJson(Map<String, dynamic> json) {
    costControlId = json['cost_control_id'];
    activityCodeStart = json['activity_code_start'];
    activityCodeEnd = json['activity_code_end'];
    costByBlock = json['cost_by_block'];
    costByAuc = json['cost_by_auc'];
    costByOrderNumber = json['cost_by_order_number'];
    costByCostCenter = json['cost_by_cost_center'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cost_control_id'] = costControlId;
    data['activity_code_start'] = activityCodeStart;
    data['activity_code_end'] = activityCodeEnd;
    data['cost_by_block'] = costByBlock;
    data['cost_by_auc'] = costByAuc;
    data['cost_by_order_number'] = costByOrderNumber;
    data['cost_by_cost_center'] = costByCostCenter;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    return data;
  }
}
