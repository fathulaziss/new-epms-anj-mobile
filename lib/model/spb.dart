class SPB {
  String? spbId;
  String? spbCardId;
  String? spbEstateCode;
  String? spbDivisionCode;
  String? spbLicenseNumber;
  int? spbType;
  dynamic spbVendorOthers;
  String? spbDeliverToCode;
  String? spbDeliverToName;
  String? spbDeliveryNote;
  String? spbLat;
  String? spbLong;
  String? spbPhoto;
  String? spbKeraniTransportEmployeeCode;
  String? spbKeraniTransportEmployeeName;
  String? spbDriverEmployeeCode;
  String? spbDriverEmployeeName;
  int? spbTotalBunches;
  int? spbTotalOph;
  int? spbTotalLooseFruit;
  double? spbCapacityTonnage;
  dynamic spbEstimateTonnage;
  String? spbActualWeightDate;
  String? spbActualWeightTime;
  dynamic spbActualTonnage;
  String? spbEstateVendorCode;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;
  int? spbIsClosed;

  SPB(
      {this.spbId,
      this.spbCardId,
      this.spbEstateCode,
      this.spbDivisionCode,
      this.spbLicenseNumber,
      this.spbType,
      this.spbVendorOthers,
      this.spbDeliverToCode,
      this.spbDeliverToName,
      this.spbDeliveryNote,
      this.spbLat,
      this.spbLong,
      this.spbPhoto,
      this.spbKeraniTransportEmployeeCode,
      this.spbKeraniTransportEmployeeName,
      this.spbDriverEmployeeCode,
      this.spbDriverEmployeeName,
      this.spbTotalBunches,
      this.spbTotalOph,
      this.spbTotalLooseFruit,
      this.spbCapacityTonnage,
      this.spbEstimateTonnage,
      this.spbActualWeightDate,
      this.spbActualWeightTime,
      this.spbActualTonnage,
      this.spbEstateVendorCode,
      this.createdBy,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime,
      this.spbIsClosed});

  SPB.fromJson(Map<String, dynamic> json) {
    spbId = json['spb_id'];
    spbCardId = json['spb_card_id'];
    spbEstateCode = json['spb_estate_code'];
    spbDivisionCode = json['spb_division_code'];
    spbLicenseNumber = json['spb_license_number'];
    spbType = json['spb_type'];
    spbVendorOthers = json['spb_vendor_others'];
    spbDeliverToCode = json['spb_deliver_to_code'];
    spbDeliverToName = json['spb_deliver_to_name'];
    spbDeliveryNote = json['spb_delivery_note'];
    spbLat = json['spb_lat'];
    spbLong = json['spb_long'];
    spbPhoto = json['spb_photo'];
    spbKeraniTransportEmployeeCode = json['spb_kerani_transport_employee_code'];
    spbKeraniTransportEmployeeName = json['spb_kerani_transport_employee_name'];
    spbDriverEmployeeCode = json['spb_driver_employee_code'];
    spbDriverEmployeeName = json['spb_driver_employee_name'];
    spbTotalBunches = json['spb_total_bunches'];
    spbTotalOph = json['spb_total_oph'];
    spbTotalLooseFruit = json['spb_total_loose_fruit'];
    spbCapacityTonnage = json['spb_capacity_tonnage'];
    spbEstimateTonnage = json['spb_estimate_tonnage'];
    spbActualWeightDate = json['spb_actual_weight_date'];
    spbActualWeightTime = json['spb_actual_weight_time'];
    spbActualTonnage = json['spb_actual_tonnage'];
    spbEstateVendorCode = json['spb_estate_vendor_code'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
    spbIsClosed = json['spb_is_closed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spb_id'] = spbId;
    data['spb_card_id'] = spbCardId;
    data['spb_estate_code'] = spbEstateCode;
    data['spb_division_code'] = spbDivisionCode;
    data['spb_license_number'] = spbLicenseNumber;
    data['spb_type'] = spbType;
    data['spb_vendor_others'] = spbVendorOthers;
    data['spb_deliver_to_code'] = spbDeliverToCode;
    data['spb_deliver_to_name'] = spbDeliverToName;
    data['spb_delivery_note'] = spbDeliveryNote;
    data['spb_lat'] = spbLat;
    data['spb_long'] = spbLong;
    data['spb_photo'] = spbPhoto;
    data['spb_kerani_transport_employee_code'] = spbKeraniTransportEmployeeCode;
    data['spb_kerani_transport_employee_name'] = spbKeraniTransportEmployeeName;
    data['spb_driver_employee_code'] = spbDriverEmployeeCode;
    data['spb_driver_employee_name'] = spbDriverEmployeeName;
    data['spb_total_bunches'] = spbTotalBunches;
    data['spb_total_oph'] = spbTotalOph;
    data['spb_total_loose_fruit'] = spbTotalLooseFruit;
    data['spb_capacity_tonnage'] = spbCapacityTonnage;
    data['spb_estimate_tonnage'] = spbEstimateTonnage;
    data['spb_actual_weight_date'] = spbActualWeightDate;
    data['spb_actual_weight_time'] = spbActualWeightTime;
    data['spb_actual_tonnage'] = spbActualTonnage;
    data['spb_estate_vendor_code'] = spbEstateVendorCode;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    data['spb_is_closed'] = spbIsClosed;
    return data;
  }
}
