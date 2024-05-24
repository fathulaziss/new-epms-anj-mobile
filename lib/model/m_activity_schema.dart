class MActivitySchema {
  int? activityId;
  String? activityCode;
  String? activityName;
  String? activityUom;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;

  MActivitySchema(
      {this.activityId,
      this.activityCode,
      this.activityName,
      this.activityUom,
      this.createdBy,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime});

  MActivitySchema.fromJson(Map<String, dynamic> json) {
    activityId = json['activity_id'];
    activityCode = json['activity_code'];
    activityName = json['activity_name'];
    activityUom = json['activity_uom'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity_id'] = activityId;
    data['activity_code'] = activityCode;
    data['activity_name'] = activityName;
    data['activity_uom'] = activityUom;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    return data;
  }
}
