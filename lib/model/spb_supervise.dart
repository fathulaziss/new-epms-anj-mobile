class SPBSupervise {
  String? spbSuperviseId;
  String? spbId;
  String? supervisiSpbEmployeeCode;
  String? supervisiSpbEmployeeName;
  String? supervisiEstateCode;
  String? supervisiSpbLat;
  String? supervisiSpbLong;
  String? supervisiSpbDriverEmployeeCode;
  String? supervisiSpbDriverEmployeeName;
  String? supervisiSpbDivisionCode;
  String? supervisiSpbLicenseNumber;
  int? supervisiSpbType;
  int? supervisiSpbMethod;
  String? supervisiSpbPhoto;
  String? supervisiSpbPhoto1;
  String? supervisiSpbPhoto2;
  int? bunchesRipe;
  int? bunchesOverripe;
  int? bunchesHalfripe;
  int? bunchesUnripe;
  int? bunchesAbnormal;
  int? bunchesEmpty;
  int? looseFruits;
  int? bunchesTotal;
  int? bunchesTotalNormal;
  int? bunchesTangkaiPanjang;
  int? bunchesSampah;
  int? bunchesBatu;

  int? unripeParteno;
  int? unripeBroken;
  int? unripeRat;
  int? unripeRotten;
  int? unripeOther;
  int? unripeAbnormalTotal;

  int? halfripeParteno;
  int? halfripeBroken;
  int? halfripeRat;
  int? halfripeRotten;
  int? halfripeOther;
  int? halfripeAbnormalTotal;

  int? ripeParteno;
  int? ripeBroken;
  int? ripeRat;
  int? ripeRotten;
  int? ripeOther;
  int? ripeAbnormalTotal;

  int? overripeParteno;
  int? overripeBroken;
  int? overripeRat;
  int? overripeRotten;
  int? overripeOther;
  int? overripeAbnormalTotal;

  int? emptyParteno;
  int? emptyBroken;
  int? emptyRat;
  int? emptyRotten;
  int? emptyOther;
  int? emptyAbnormalTotal;

  String? catatanBunchesTangkaiPanjang;
  String? supervisiNotes;
  String? createdBy;
  String? supervisiSpbDate;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;

  SPBSupervise(
      {this.spbSuperviseId,
      this.spbId,
      this.supervisiSpbEmployeeCode,
      this.supervisiSpbEmployeeName,
      this.supervisiEstateCode,
      this.supervisiSpbLat,
      this.supervisiSpbLong,
      this.supervisiSpbDriverEmployeeCode,
      this.supervisiSpbDriverEmployeeName,
      this.supervisiSpbDivisionCode,
      this.supervisiSpbLicenseNumber,
      this.supervisiSpbType,
      this.supervisiSpbMethod,
      this.supervisiSpbPhoto,
      this.supervisiSpbPhoto1,
      this.supervisiSpbPhoto2,
      this.bunchesRipe,
      this.bunchesOverripe,
      this.bunchesHalfripe,
      this.bunchesUnripe,
      this.bunchesAbnormal,
      this.bunchesEmpty,
      this.looseFruits,
      this.bunchesTotal,
      this.bunchesTotalNormal,
      this.bunchesTangkaiPanjang,
      this.bunchesSampah,
      this.bunchesBatu,
      this.unripeParteno,
      this.unripeBroken,
      this.unripeRat,
      this.unripeRotten,
      this.unripeOther,
      this.unripeAbnormalTotal,
      this.halfripeParteno,
      this.halfripeBroken,
      this.halfripeRat,
      this.halfripeRotten,
      this.halfripeOther,
      this.halfripeAbnormalTotal,
      this.ripeParteno,
      this.ripeBroken,
      this.ripeRat,
      this.ripeRotten,
      this.ripeOther,
      this.ripeAbnormalTotal,
      this.overripeParteno,
      this.overripeBroken,
      this.overripeRat,
      this.overripeRotten,
      this.overripeOther,
      this.overripeAbnormalTotal,
      this.emptyParteno,
      this.emptyBroken,
      this.emptyRat,
      this.emptyRotten,
      this.emptyOther,
      this.emptyAbnormalTotal,
      this.catatanBunchesTangkaiPanjang,
      this.supervisiNotes,
      this.createdBy,
      this.supervisiSpbDate,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime});

  SPBSupervise.fromJson(Map<String, dynamic> json) {
    spbSuperviseId = json['spb_supervisi_id'];
    spbId = json['spb_id'];
    supervisiSpbEmployeeCode = json['supervisi_spb_employee_code'];
    supervisiSpbEmployeeName = json['supervisi_spb_employee_name'];
    supervisiEstateCode = json['supervisi_spb_estate_code'];
    supervisiSpbLat = json['supervisi_spb_lat'];
    supervisiSpbLong = json['supervisi_spb_long'];
    supervisiSpbDriverEmployeeCode = json['supervisi_spb_driver_employee_code'];
    supervisiSpbDriverEmployeeName = json['supervisi_spb_driver_employee_name'];
    supervisiSpbDivisionCode = json['supervisi_spb_division_code'];
    supervisiSpbLicenseNumber = json['supervisi_spb_license_number'];
    supervisiSpbType = json['supervisi_spb_type'];
    supervisiSpbMethod = json['supervisi_spb_method'];
    supervisiSpbPhoto = json['supervisi_spb_photo'];
    supervisiSpbPhoto1 = json['supervisi_spb_photo1'];
    supervisiSpbPhoto2 = json['supervisi_spb_photo2'];
    bunchesRipe = json['bunches_ripe'];
    bunchesOverripe = json['bunches_overripe'];
    bunchesHalfripe = json['bunches_halfripe'];
    bunchesUnripe = json['bunches_unripe'];
    bunchesAbnormal = json['bunches_abnormal'];
    bunchesEmpty = json['bunches_empty'];
    looseFruits = json['loose_fruits'];
    bunchesTotal = json['bunches_total'];
    bunchesTotalNormal = json['bunches_total_normal'];
    bunchesTangkaiPanjang = json['bunches_tangkai_panjang'];
    bunchesSampah = json['bunches_sampah'];
    bunchesBatu = json['bunches_batu'];

    unripeParteno = json['unripe_parteno'];
    unripeBroken = json['unripe_broken'];
    unripeRat = json['unripe_rat'];
    unripeRotten = json['unripe_rotten'];
    unripeOther = json['unripe_other'];
    unripeAbnormalTotal = json['unripe_abnormal_total'];

    halfripeParteno = json['halfripe_parteno'];
    halfripeBroken = json['halfripe_broken'];
    halfripeRat = json['halfripe_rat'];
    halfripeRotten = json['halfripe_rotten'];
    halfripeOther = json['halfripe_other'];
    halfripeAbnormalTotal = json['halfripe_abnormal_total'];

    ripeParteno = json['ripe_parteno'];
    ripeBroken = json['ripe_broken'];
    ripeRat = json['ripe_rat'];
    ripeRotten = json['ripe_rotten'];
    ripeOther = json['ripe_other'];
    ripeAbnormalTotal = json['ripe_abnormal_total'];

    overripeParteno = json['overripe_parteno'];
    overripeBroken = json['overripe_broken'];
    overripeRat = json['overripe_rat'];
    overripeRotten = json['overripe_rotten'];
    overripeOther = json['overripe_other'];
    overripeAbnormalTotal = json['overripe_abnormal_total'];

    emptyParteno = json['empty_parteno'];
    emptyBroken = json['empty_broken'];
    emptyRat = json['empty_rat'];
    emptyRotten = json['empty_rotten'];
    emptyOther = json['empty_other'];
    emptyAbnormalTotal = json['empty_abnormal_total'];

    catatanBunchesTangkaiPanjang = json['catatan_bunches_tangkai_panjang'];
    supervisiNotes = json['supervisi_notes'];
    createdBy = json['created_by'];
    supervisiSpbDate = json['supervisi_spb_date'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spb_supervisi_id'] = spbSuperviseId;
    data['spb_id'] = spbId;
    data['supervisi_spb_employee_code'] = supervisiSpbEmployeeCode;
    data['supervisi_spb_employee_name'] = supervisiSpbEmployeeName;
    data['supervisi_spb_estate_code'] = supervisiEstateCode;
    data['supervisi_spb_lat'] = supervisiSpbLat;
    data['supervisi_spb_long'] = supervisiSpbLong;
    data['supervisi_spb_driver_employee_code'] = supervisiSpbDriverEmployeeCode;
    data['supervisi_spb_driver_employee_name'] = supervisiSpbDriverEmployeeName;
    data['supervisi_spb_division_code'] = supervisiSpbDivisionCode;
    data['supervisi_spb_license_number'] = supervisiSpbLicenseNumber;
    data['supervisi_spb_type'] = supervisiSpbType;
    data['supervisi_spb_method'] = supervisiSpbMethod;
    data['supervisi_spb_photo'] = supervisiSpbPhoto;
    data['supervisi_spb_photo1'] = supervisiSpbPhoto1;
    data['supervisi_spb_photo2'] = supervisiSpbPhoto2;
    data['bunches_ripe'] = bunchesRipe;
    data['bunches_overripe'] = bunchesOverripe;
    data['bunches_halfripe'] = bunchesHalfripe;
    data['bunches_unripe'] = bunchesUnripe;
    data['bunches_abnormal'] = bunchesAbnormal;
    data['bunches_empty'] = bunchesEmpty;
    data['loose_fruits'] = looseFruits;
    data['bunches_total'] = bunchesTotal;
    data['bunches_total_normal'] = bunchesTotalNormal;
    data['bunches_tangkai_panjang'] = bunchesTangkaiPanjang;
    data['bunches_sampah'] = bunchesSampah;
    data['bunches_batu'] = bunchesBatu;

    data['unripe_parteno'] = unripeParteno;
    data['unripe_broken'] = unripeBroken;
    data['unripe_rat'] = unripeRat;
    data['unripe_rotten'] = unripeRotten;
    data['unripe_other'] = unripeOther;
    data['unripe_abnormal_total'] = unripeAbnormalTotal;

    data['halfripe_parteno'] = halfripeParteno;
    data['halfripe_broken'] = halfripeBroken;
    data['halfripe_rat'] = halfripeRat;
    data['halfripe_rotten'] = halfripeRotten;
    data['halfripe_other'] = halfripeOther;
    data['halfripe_abnormal_total'] = halfripeAbnormalTotal;

    data['ripe_parteno'] = ripeParteno;
    data['ripe_broken'] = ripeBroken;
    data['ripe_rat'] = ripeRat;
    data['ripe_rotten'] = ripeRotten;
    data['ripe_other'] = ripeOther;
    data['ripe_abnormal_total'] = ripeAbnormalTotal;

    data['overripe_parteno'] = overripeParteno;
    data['overripe_broken'] = overripeBroken;
    data['overripe_rat'] = overripeRat;
    data['overripe_rotten'] = overripeRotten;
    data['overripe_other'] = overripeOther;
    data['overripe_abnormal_total'] = overripeAbnormalTotal;

    data['empty_parteno'] = emptyParteno;
    data['empty_broken'] = emptyBroken;
    data['empty_rat'] = emptyRat;
    data['empty_rotten'] = emptyRotten;
    data['empty_other'] = emptyOther;
    data['empty_abnormal_total'] = emptyAbnormalTotal;

    data['catatan_bunches_tangkai_panjang'] = catatanBunchesTangkaiPanjang;
    data['supervisi_notes'] = supervisiNotes;
    data['created_by'] = createdBy;
    data['supervisi_spb_date'] = supervisiSpbDate;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    return data;
  }

  @override
  String toString() {
    return 'SPBSupervise(spb_supervisi_id: $spbSuperviseId, spb_id: $spbId, supervisi_spb_employee_code: $supervisiSpbEmployeeCode, supervisi_spb_employee_name: $supervisiSpbEmployeeName, supervisi_spb_estate_code: $supervisiEstateCode, supervisi_spb_lat: $supervisiSpbLat, supervisi_spb_long: $supervisiSpbLong, supervisi_spb_driver_employee_code: $supervisiSpbDriverEmployeeCode, supervisi_spb_driver_employee_name: $supervisiSpbDriverEmployeeName, supervisi_spb_division_code: $supervisiSpbDivisionCode, supervisi_spb_license_number: $supervisiSpbLicenseNumber, supervisi_spb_type: $supervisiSpbType, supervisi_spb_method: $supervisiSpbMethod, supervisi_spb_photo: $supervisiSpbPhoto, supervisi_spb_photo1: $supervisiSpbPhoto1, supervisi_spb_photo2: $supervisiSpbPhoto2, bunches_ripe: $bunchesRipe, bunches_overripe: $bunchesOverripe, bunches_halfripe: $bunchesHalfripe, bunches_unripe: $bunchesUnripe, bunches_abnormal: $bunchesAbnormal, bunches_empty: $bunchesEmpty, loose_fruits: $looseFruits, bunches_total: $bunchesTotal, bunches_total_normal: $bunchesTotalNormal, bunches_tangkai_panjang: $bunchesTangkaiPanjang, bunches_sampah: $bunchesSampah, bunches_batu: $bunchesBatu, unripe_parteno: $unripeParteno, unripe_broken: $unripeBroken, unripe_rat: $unripeRat, unripe_rotten: $unripeRotten, unripe_other: $unripeOther, unripe_abnormal_total: $unripeAbnormalTotal, halfripe_parteno: $halfripeParteno, halfripe_broken: $halfripeBroken, halfripe_rat: $halfripeRat, halfripe_rotten: $halfripeRotten, halfripe_other: $halfripeOther, halfripe_abnormal_total: $halfripeAbnormalTotal, ripe_parteno: $ripeParteno, ripe_broken: $ripeBroken, ripe_rat: $ripeRat, ripe_rotten: $ripeRotten, ripe_other: $ripeOther, ripe_abnormal_total: $ripeAbnormalTotal, overripe_parteno: $overripeParteno, overripe_broken: $overripeBroken, overripe_rat: $overripeRat, overripe_rotten: $overripeRotten, overripe_other: $overripeOther, overripe_abnormal_total: $overripeAbnormalTotal, empty_parteno: $emptyParteno, empty_broken: $emptyBroken, empty_rat: $emptyRat, empty_rotten: $emptyRotten, empty_other: $emptyOther, empty_abnormal_total: $emptyAbnormalTotal, catatan_bunches_tangkai_panjang: $catatanBunchesTangkaiPanjang, supervisi_notes: $supervisiNotes, created_by: $createdBy, supervisi_spb_date: $supervisiSpbDate, created_date: $createdDate, created_time: $createdTime, updated_by: $updatedBy, updated_date: $updatedDate, updated_time: $updatedTime)';
  }
}
