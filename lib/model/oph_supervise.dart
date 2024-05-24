class OPHSupervise {
  String? ophSupervisiId;
  String? supervisiEstateCode;
  String? supervisiBlockCode;
  String? supervisiTphCode;
  String? ophId;
  String? supervisiEmployeeCode;
  String? supervisiEmployeeName;
  String? supervisiLat;
  String? supervisiLong;
  String? supervisiMandorEmployeeCode;
  String? supervisiMandorEmployeeName;
  String? supervisiKeraniPanenEmployeeCode;
  String? supervisiKeraniPanenEmployeeName;
  String? supervisiPemanenEmployeeName;
  String? supervisiPemanenEmployeeCode;
  String? supervisiPhoto;
  String? supervisiDivisionCode;
  int? bunchesRipe;
  int? bunchesOverripe;
  int? bunchesHalfripe;
  int? bunchesUnripe;
  int? bunchesAbnormal;
  int? bunchesEmpty;
  int? looseFruits;
  int? bunchesTotal;
  int? bunchesNotSent;
  String? supervisiNotes;
  String? createdBy;
  String? supervisiDate;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;

  OPHSupervise(
      {this.ophSupervisiId,
      this.supervisiEstateCode,
      this.supervisiBlockCode,
      this.supervisiTphCode,
      this.ophId,
      this.supervisiEmployeeCode,
      this.supervisiEmployeeName,
      this.supervisiLat,
      this.supervisiLong,
      this.supervisiMandorEmployeeCode,
      this.supervisiMandorEmployeeName,
      this.supervisiKeraniPanenEmployeeCode,
      this.supervisiKeraniPanenEmployeeName,
      this.supervisiPemanenEmployeeName,
      this.supervisiPemanenEmployeeCode,
      this.supervisiPhoto,
      this.supervisiDivisionCode,
      this.bunchesRipe,
      this.bunchesOverripe,
      this.bunchesHalfripe,
      this.bunchesUnripe,
      this.bunchesAbnormal,
      this.bunchesEmpty,
      this.looseFruits,
      this.bunchesTotal,
      this.bunchesNotSent,
      this.supervisiNotes,
      this.createdBy,
      this.supervisiDate,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime});

  OPHSupervise.fromJson(Map<String, dynamic> json) {
    ophSupervisiId = json['oph_supervisi_id'];
    supervisiEstateCode = json['supervisi_estate_code'];
    supervisiBlockCode = json['supervisi_block_code'];
    supervisiTphCode = json['supervisi_tph_code'];
    ophId = json['oph_id'];
    supervisiEmployeeCode = json['supervisi_employee_code'];
    supervisiEmployeeName = json['supervisi_employee_name'];
    supervisiLat = json['supervisi_lat'];
    supervisiLong = json['supervisi_long'];
    supervisiMandorEmployeeCode = json['supervisi_mandor_employee_code'];
    supervisiMandorEmployeeName = json['supervisi_mandor_employee_name'];
    supervisiKeraniPanenEmployeeCode =
        json['supervisi_kerani_panen_employee_code'];
    supervisiKeraniPanenEmployeeName =
        json['supervisi_kerani_panen_employee_name'];
    supervisiPemanenEmployeeName = json['supervisi_pemanen_employee_name'];
    supervisiPemanenEmployeeCode = json['supervisi_pemanen_employee_code'];
    supervisiPhoto = json['supervisi_photo'];
    supervisiDivisionCode = json['supervisi_division_code'];
    bunchesRipe = json['bunches_ripe'];
    bunchesOverripe = json['bunches_overripe'];
    bunchesHalfripe = json['bunches_halfripe'];
    bunchesUnripe = json['bunches_unripe'];
    bunchesAbnormal = json['bunches_abnormal'];
    bunchesEmpty = json['bunches_empty'];
    looseFruits = json['loose_fruits'];
    bunchesTotal = json['bunches_total'];
    bunchesNotSent = json['bunches_not_sent'];
    supervisiNotes = json['supervisi_notes'];
    createdBy = json['created_by'];
    supervisiDate = json['supervisi_date'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oph_supervisi_id'] = ophSupervisiId;
    data['supervisi_estate_code'] = supervisiEstateCode;
    data['supervisi_block_code'] = supervisiBlockCode;
    data['supervisi_tph_code'] = supervisiTphCode;
    data['oph_id'] = ophId;
    data['supervisi_employee_code'] = supervisiEmployeeCode;
    data['supervisi_employee_name'] = supervisiEmployeeName;
    data['supervisi_lat'] = supervisiLat;
    data['supervisi_long'] = supervisiLong;
    data['supervisi_mandor_employee_code'] = supervisiMandorEmployeeCode;
    data['supervisi_mandor_employee_name'] = supervisiMandorEmployeeName;
    data['supervisi_kerani_panen_employee_code'] =
        supervisiKeraniPanenEmployeeCode;
    data['supervisi_kerani_panen_employee_name'] =
        supervisiKeraniPanenEmployeeName;
    data['supervisi_pemanen_employee_name'] = supervisiPemanenEmployeeName;
    data['supervisi_pemanen_employee_code'] = supervisiPemanenEmployeeCode;
    data['supervisi_photo'] = supervisiPhoto;
    data['supervisi_division_code'] = supervisiDivisionCode;
    data['bunches_ripe'] = bunchesRipe;
    data['bunches_overripe'] = bunchesOverripe;
    data['bunches_halfripe'] = bunchesHalfripe;
    data['bunches_unripe'] = bunchesUnripe;
    data['bunches_abnormal'] = bunchesAbnormal;
    data['bunches_empty'] = bunchesEmpty;
    data['loose_fruits'] = looseFruits;
    data['bunches_total'] = bunchesTotal;
    data['bunches_not_sent'] = bunchesNotSent;
    data['supervisi_notes'] = supervisiNotes;
    data['created_by'] = createdBy;
    data['supervisi_date'] = supervisiDate;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    return data;
  }

  @override
  String toString() {
    return 'OPHSupervise(supervisi_pemanen_employee_name: $supervisiPemanenEmployeeName, supervisi_pemanen_employee_code: $supervisiPemanenEmployeeCode, created_by: $createdBy)';
  }
}
