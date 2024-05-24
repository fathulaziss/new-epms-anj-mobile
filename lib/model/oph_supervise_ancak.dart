class OPHSuperviseAncak {
  String? supervisiAncakId;
  String? supervisiAncakEstateCode;
  String? supervisiAncakBlockCode;
  String? supervisiAncakLat;
  String? supervisiAncakLong;
  String? supervisiAncakLatEnd;
  String? supervisiAncakLongEnd;
  String? supervisiAncakMandorEmployeeCode;
  String? supervisiAncakMandorEmployeeName;
  String? supervisiAncakPemanenEmployeeCode;
  String? supervisiAncakPemanenEmployeeName;
  int? supervisiAncakAssignToId;
  String? supervisiAncakAssignToName;
  String? supervisiAncakPhoto;
  String? supervisiAncakDivisionCode;
  String? pokokSample;
  int? bunchesVCut;
  int? bunchesRat;
  int? bunchesTangkaiPanjang;
  int? pelepahSengkleh;
  int? bunchesTinggal;
  dynamic bunchesTinggalPercentage;
  int? bunchesBrondolanTinggal;
  dynamic bunchesBrondolanTinggalPercentage;
  int? bunchesTotal;
  int? looseFruits;
  String? supervisiAncakNotes;
  String? createdBy;
  String? supervisiAncakEmployeeCode;
  String? supervisiAncakEmployeeName;
  String? supervisiAncakDate;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;

  OPHSuperviseAncak(
      {this.supervisiAncakId,
      this.supervisiAncakEstateCode,
      this.supervisiAncakBlockCode,
      this.supervisiAncakLat,
      this.supervisiAncakLong,
      this.supervisiAncakLatEnd,
      this.supervisiAncakLongEnd,
      this.supervisiAncakMandorEmployeeCode,
      this.supervisiAncakMandorEmployeeName,
      this.supervisiAncakPemanenEmployeeCode,
      this.supervisiAncakPemanenEmployeeName,
      this.supervisiAncakAssignToId,
      this.supervisiAncakAssignToName,
      this.supervisiAncakPhoto,
      this.supervisiAncakDivisionCode,
      this.pokokSample,
      this.bunchesVCut,
      this.bunchesRat,
      this.bunchesTangkaiPanjang,
      this.pelepahSengkleh,
      this.bunchesTinggal,
      this.bunchesTinggalPercentage,
      this.bunchesBrondolanTinggal,
      this.bunchesBrondolanTinggalPercentage,
      this.bunchesTotal,
      this.looseFruits,
      this.supervisiAncakNotes,
      this.createdBy,
      this.supervisiAncakEmployeeCode,
      this.supervisiAncakEmployeeName,
      this.supervisiAncakDate,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime});

  OPHSuperviseAncak.fromJson(Map<String, dynamic> json) {
    supervisiAncakId = json['supervisi_ancak_id'];
    supervisiAncakEstateCode = json['supervisi_ancak_estate_code'];
    supervisiAncakBlockCode = json['supervisi_ancak_block_code'];
    supervisiAncakLat = json['supervisi_ancak_lat'];
    supervisiAncakLong = json['supervisi_ancak_long'];
    supervisiAncakLatEnd = json['supervisi_ancak_lat_end'];
    supervisiAncakLongEnd = json['supervisi_ancak_long_end'];
    supervisiAncakMandorEmployeeCode =
        json['supervisi_ancak_mandor_employee_code'];
    supervisiAncakMandorEmployeeName =
        json['supervisi_ancak_mandor_employee_name'];
    supervisiAncakPemanenEmployeeCode =
        json['supervisi_ancak_pemanen_employee_code'];
    supervisiAncakPemanenEmployeeName =
        json['supervisi_ancak_pemanen_employee_name'];
    supervisiAncakAssignToId = json['supervisi_ancak_assign_to_id'];
    supervisiAncakAssignToName = json['supervisi_ancak_assign_to_name'];
    supervisiAncakPhoto = json['supervisi_ancak_photo'];
    supervisiAncakDivisionCode = json['supervisi_ancak_division_code'];
    pokokSample = json['pokok_sample'];
    bunchesVCut = json['bunches_v_cut'];
    bunchesRat = json['bunches_rat'];
    bunchesTangkaiPanjang = json['bunches_tangkai_panjang'];
    pelepahSengkleh = json['pelepah_sengkleh'];
    bunchesTinggal = json['bunches_tinggal'];
    bunchesTinggalPercentage = json['bunches_tinggal_percentage'];
    bunchesBrondolanTinggal = json['bunches_brondolan_tinggal'];
    bunchesBrondolanTinggalPercentage =
        json['bunches_brondolan_tinggal_percentage'];
    bunchesTotal = json['bunches_total'];
    looseFruits = json['loose_fruits'];
    supervisiAncakNotes = json['supervisi_ancak_notes'];
    createdBy = json['created_by'];
    supervisiAncakEmployeeCode = json['supervisi_ancak_employee_code'];
    supervisiAncakEmployeeName = json['supervisi_ancak_employee_name'];
    supervisiAncakDate = json['supervisi_ancak_date'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['supervisi_ancak_id'] = supervisiAncakId;
    data['supervisi_ancak_estate_code'] = supervisiAncakEstateCode;
    data['supervisi_ancak_block_code'] = supervisiAncakBlockCode;
    data['supervisi_ancak_lat'] = supervisiAncakLat;
    data['supervisi_ancak_long'] = supervisiAncakLong;
    data['supervisi_ancak_lat_end'] = supervisiAncakLatEnd;
    data['supervisi_ancak_long_end'] = supervisiAncakLongEnd;
    data['supervisi_ancak_mandor_employee_code'] =
        supervisiAncakMandorEmployeeCode;
    data['supervisi_ancak_mandor_employee_name'] =
        supervisiAncakMandorEmployeeName;
    data['supervisi_ancak_pemanen_employee_code'] =
        supervisiAncakPemanenEmployeeCode;
    data['supervisi_ancak_pemanen_employee_name'] =
        supervisiAncakPemanenEmployeeName;
    data['supervisi_ancak_assign_to_id'] = supervisiAncakAssignToId;
    data['supervisi_ancak_assign_to_name'] = supervisiAncakAssignToName;
    data['supervisi_ancak_photo'] = supervisiAncakPhoto;
    data['supervisi_ancak_division_code'] = supervisiAncakDivisionCode;
    data['pokok_sample'] = pokokSample;
    data['bunches_v_cut'] = bunchesVCut;
    data['bunches_rat'] = bunchesRat;
    data['bunches_tangkai_panjang'] = bunchesTangkaiPanjang;
    data['pelepah_sengkleh'] = pelepahSengkleh;
    data['bunches_tinggal'] = bunchesTinggal;
    data['bunches_tinggal_percentage'] = bunchesTinggalPercentage;
    data['bunches_brondolan_tinggal'] = bunchesBrondolanTinggal;
    data['bunches_brondolan_tinggal_percentage'] =
        bunchesBrondolanTinggalPercentage;
    data['bunches_total'] = bunchesTotal;
    data['loose_fruits'] = looseFruits;
    data['supervisi_ancak_notes'] = supervisiAncakNotes;
    data['created_by'] = createdBy;
    data['supervisi_ancak_employee_code'] = supervisiAncakEmployeeCode;
    data['supervisi_ancak_employee_name'] = supervisiAncakEmployeeName;
    data['supervisi_ancak_date'] = supervisiAncakDate;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    return data;
  }
}
