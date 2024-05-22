class PanenKemarin {
  String? ophId;
  String? ophCardId;
  String? ophHarvestingMethod;
  String? ophHarvestingType;
  String? ophEstateCode;
  String? ophPlantCode;
  String? ophDivisionCode;
  String? ophBlockCode;
  String? ophTphCode;
  String? ophNotes;
  String? ophLat;
  String? ophLong;
  String? ophPhoto;
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
  String? bunchesRipe;
  String? bunchesOverripe;
  String? bunchesHalfripe;
  String? bunchesUnripe;
  String? bunchesAbnormal;
  String? bunchesEmpty;
  String? looseFruits;
  String? bunchesTotal;
  String? bunchesNotSent;
  String? ophEstimateTonnage;
  String? isPlanned;
  String? isApproved;
  String? isRestantPermanent;
  String? ophApprovedBy;
  String? ophApprovedByName;
  String? ophApprovedDate;
  String? ophApprovedTime;
  String? ophCustomerCode;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;
  String? ophPickupDate;
  String? ophPickupTime;
  String? ophIsClosed;
  String? ophEstimateTonage;

  PanenKemarin(
      {this.ophId,
      this.ophCardId,
      this.ophHarvestingMethod,
      this.ophHarvestingType,
      this.ophEstateCode,
      this.ophPlantCode,
      this.ophDivisionCode,
      this.ophBlockCode,
      this.ophTphCode,
      this.ophNotes,
      this.ophLat,
      this.ophLong,
      this.ophPhoto,
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
      this.bunchesRipe,
      this.bunchesOverripe,
      this.bunchesHalfripe,
      this.bunchesUnripe,
      this.bunchesAbnormal,
      this.bunchesEmpty,
      this.looseFruits,
      this.bunchesTotal,
      this.bunchesNotSent,
      this.ophEstimateTonnage,
      this.isPlanned,
      this.isApproved,
      this.isRestantPermanent,
      this.ophApprovedBy,
      this.ophApprovedByName,
      this.ophApprovedDate,
      this.ophApprovedTime,
      this.ophCustomerCode,
      this.createdBy,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime,
      this.ophPickupDate,
      this.ophPickupTime,
      this.ophIsClosed,
      this.ophEstimateTonage});

  PanenKemarin.fromJson(Map<String, dynamic> json) {
    ophId = json['oph_id'];
    ophCardId = json['oph_card_id'];
    ophHarvestingMethod = json['oph_harvesting_method'];
    ophHarvestingType = json['oph_harvesting_type'];
    ophEstateCode = json['oph_estate_code'];
    ophPlantCode = json['oph_plant_code'];
    ophDivisionCode = json['oph_division_code'];
    ophBlockCode = json['oph_block_code'];
    ophTphCode = json['oph_tph_code'];
    ophNotes = json['oph_notes'];
    ophLat = json['oph_lat'];
    ophLong = json['oph_long'];
    ophPhoto = json['oph_photo'];
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
    bunchesRipe = json['bunches_ripe'];
    bunchesOverripe = json['bunches_overripe'];
    bunchesHalfripe = json['bunches_halfripe'];
    bunchesUnripe = json['bunches_unripe'];
    bunchesAbnormal = json['bunches_abnormal'];
    bunchesEmpty = json['bunches_empty'];
    looseFruits = json['loose_fruits'];
    bunchesTotal = json['bunches_total'];
    bunchesNotSent = json['bunches_not_sent'];
    ophEstimateTonnage = json['oph_estimate_tonnage'];
    isPlanned = json['is_planned'];
    isApproved = json['is_approved'];
    isRestantPermanent = json['is_restant_permanent'];
    ophApprovedBy = json['oph_approved_by'];
    ophApprovedByName = json['oph_approved_by_name'];
    ophApprovedDate = json['oph_approved_date'];
    ophApprovedTime = json['oph_approved_time'];
    ophCustomerCode = json['oph_customer_code'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
    ophPickupDate = json['oph_pickup_date'];
    ophPickupTime = json['oph_pickup_time'];
    ophIsClosed = json['oph_is_closed'];
    ophEstimateTonage = json['oph_estimate_tonage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oph_id'] = ophId;
    data['oph_card_id'] = ophCardId;
    data['oph_harvesting_method'] = ophHarvestingMethod;
    data['oph_harvesting_type'] = ophHarvestingType;
    data['oph_estate_code'] = ophEstateCode;
    data['oph_plant_code'] = ophPlantCode;
    data['oph_division_code'] = ophDivisionCode;
    data['oph_block_code'] = ophBlockCode;
    data['oph_tph_code'] = ophTphCode;
    data['oph_notes'] = ophNotes;
    data['oph_lat'] = ophLat;
    data['oph_long'] = ophLong;
    data['oph_photo'] = ophPhoto;
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
    data['bunches_ripe'] = bunchesRipe;
    data['bunches_overripe'] = bunchesOverripe;
    data['bunches_halfripe'] = bunchesHalfripe;
    data['bunches_unripe'] = bunchesUnripe;
    data['bunches_abnormal'] = bunchesAbnormal;
    data['bunches_empty'] = bunchesEmpty;
    data['loose_fruits'] = looseFruits;
    data['bunches_total'] = bunchesTotal;
    data['bunches_not_sent'] = bunchesNotSent;
    data['oph_estimate_tonnage'] = ophEstimateTonnage;
    data['is_planned'] = isPlanned;
    data['is_approved'] = isApproved;
    data['is_restant_permanent'] = isRestantPermanent;
    data['oph_approved_by'] = ophApprovedBy;
    data['oph_approved_by_name'] = ophApprovedByName;
    data['oph_approved_date'] = ophApprovedDate;
    data['oph_approved_time'] = ophApprovedTime;
    data['oph_customer_code'] = ophCustomerCode;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    data['oph_pickup_date'] = ophPickupDate;
    data['oph_pickup_time'] = ophPickupTime;
    data['oph_is_closed'] = ophIsClosed;
    data['oph_estimate_tonage'] = ophEstimateTonage;
    return data;
  }
}
