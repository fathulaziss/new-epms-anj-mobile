class TBSLuar {
  String? sortasiID;
  String? supervisiName;
  dynamic gpsLat;
  dynamic gpsLong;
  dynamic quantity;
  dynamic formType;
  String? contractNumber;
  String? supplierCode;
  String? supplierName;
  String? driverName;
  String? licenseNumber;
  String? spdID;
  dynamic bunchesUnripe;
  dynamic bunchesLess4Kg;
  dynamic brondolanRotten;
  dynamic bunchesCengkeh;
  dynamic bunchesHalfripe;
  dynamic bunchesOverripe;
  dynamic bunchesRotten;
  dynamic bunchesAbnormal;
  dynamic bunchesEmpty;
  dynamic rubbish;
  dynamic water;
  dynamic longStalk;
  dynamic bunchesTotal;
  dynamic deduction;
  dynamic small;
  dynamic medium;
  dynamic large;
  String? gradingPhoto;
  String? notes;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;

  TBSLuar(
      {this.sortasiID,
      this.supervisiName,
      this.gpsLat,
      this.gpsLong,
      this.quantity,
      this.formType,
      this.contractNumber,
      this.supplierCode,
      this.supplierName,
      this.driverName,
      this.licenseNumber,
      this.spdID,
      this.bunchesUnripe,
      this.bunchesLess4Kg,
      this.brondolanRotten,
      this.bunchesCengkeh,
      this.bunchesHalfripe,
      this.bunchesOverripe,
      this.bunchesRotten,
      this.bunchesAbnormal,
      this.bunchesEmpty,
      this.rubbish,
      this.water,
      this.longStalk,
      this.bunchesTotal,
      this.deduction,
      this.small,
      this.medium,
      this.large,
      this.notes,
      this.gradingPhoto,
      this.createdBy,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime});

  TBSLuar.fromJson(Map<String, dynamic> json) {
    sortasiID = json['sortasi_id'];
    supervisiName = json['supervisi_name'];
    gpsLat = json['gps_lat'];
    gpsLong = json['gps_long'];
    quantity = json['quantity'];
    formType = json['form_type'];
    contractNumber = json['contract_number'];
    supplierCode = json['supplier_code'];
    supplierName = json['supplier_name'];
    driverName = json['driver_name'];
    licenseNumber = json['license_number'];
    spdID = json['spb_id'];
    bunchesUnripe = json['bunches_unripe'];
    bunchesLess4Kg = json['bunches_less_4_kg'];
    bunchesCengkeh = json['bunches_cengkeh'];
    brondolanRotten = json['brondolan_rotten'];
    bunchesHalfripe = json['bunches_halfripe'];
    bunchesOverripe = json['bunches_overripe'];
    bunchesRotten = json['bunches_rotten'];
    bunchesAbnormal = json['bunches_abnormal'];
    bunchesEmpty = json['bunches_empty'];
    rubbish = json['rubbish'];
    water = json['water'];
    longStalk = json['long_stalk'];
    bunchesTotal = json['bunches_total'];
    deduction = json['deduction'];
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    notes = json['notes'];
    gradingPhoto = json['grading_photo'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sortasi_id'] = sortasiID;
    data['supervisi_name'] = supervisiName;
    data['gps_lat'] = gpsLat;
    data['gps_long'] = gpsLong;
    data['quantity'] = quantity;
    data['contract_number'] = contractNumber;
    data['supplier_code'] = supplierCode;
    data['supplier_name'] = supplierName;
    data['driver_name'] = driverName;
    data['license_number'] = licenseNumber;
    data['spb_id'] = spdID;
    data['bunches_unripe'] = bunchesUnripe;
    data['form_type'] = formType;
    data['bunches_less_4_kg'] = bunchesLess4Kg;
    data['bunches_cengkeh'] = bunchesCengkeh;
    data['brondolan_rotten'] = brondolanRotten;
    data['bunches_halfripe'] = bunchesHalfripe;
    data['bunches_overripe'] = bunchesOverripe;
    data['bunches_rotten'] = bunchesRotten;
    data['bunches_abnormal'] = bunchesAbnormal;
    data['bunches_empty'] = bunchesEmpty;
    data['rubbish'] = rubbish;
    data['water'] = water;
    data['long_stalk'] = longStalk;
    data['bunches_total'] = bunchesTotal;
    data['deduction'] = deduction;
    data['small'] = small;
    data['medium'] = medium;
    data['large'] = large;
    data['notes'] = notes;
    data['grading_photo'] = gradingPhoto;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    return data;
  }

  @override
  String toString() {
    return 'TBSLuar(sortasi_id: $sortasiID, supervisi_name: $supervisiName, gps_lat: $gpsLat, gps_long: $gpsLong, quantity: $quantity, contract_number: $contractNumber, supplier_code: $supplierCode, supplier_name: $supplierName, driver_name: $driverName, license_number: $licenseNumber, spb_id: $spdID, bunches_unripe: $bunchesUnripe, form_type: $formType, bunches_less_4_kg: $bunchesLess4Kg, bunches_cengkeh: $bunchesCengkeh, brondolan_rotten: $brondolanRotten, bunches_halfripe: $bunchesHalfripe, bunches_overripe: $bunchesOverripe, bunches_rotten: $bunchesRotten, bunches_abnormal: $bunchesAbnormal, bunches_empty: $bunchesEmpty, rubbish: $rubbish, water: $water, long_stalk: $longStalk, bunches_total: $bunchesTotal, deduction: $deduction, small: $small, medium: $medium, large: $large, notes: $notes, grading_photo: $gradingPhoto, created_by: $createdBy, created_date: $createdDate, created_time: $createdTime, updated_by: $updatedBy, updated_date: $updatedDate, updated_time: $updatedTime)';
  }
}
