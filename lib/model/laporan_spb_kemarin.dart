class LaporanSPBKemarin {
  String? spbId;
  String? spbCardId;
  String? spbEstateCode;
  String? spbDivisionCode;
  String? spbLicenseNumber;
  dynamic spbType;
  String? spbDeliverToCode;
  String? spbDeliverToName;
  String? spbDeliveryNote;
  String? spbLat;
  String? spbLong;
  String? spbKeraniTransportEmployeeCode;
  String? spbKeraniTransportEmployeeName;
  String? spbDriverEmployeeCode;
  String? spbDriverEmployeeName;
  int? spbTotalBunches;
  int? spbTotalOph;
  int? spbTotalLooseFruit;
  String? createdDate;
  String? createdTime;
  dynamic spbCapacityTonnage;
  dynamic spbEstimateTonnage;
  String? spbActualWeightDate;
  String? spbActualWeightTime;
  dynamic spbActualTonnage;
  int? spbIsClosed;
  String? spbPhoto;
  String? spbCertificateId;
  String? certificationCertNoRspo;
  String? certificationCertNoIspo;
  String? certificationCertNoIscc;
  String? certificationNilaiGhgNoRspo;
  String? certificationNilaiGhgNoIspo;
  String? certificationNilaiGhgNoIscc;
  String? certificationIsccId;
  String? certificationIspoId;
  String? certificationRspoId;

  LaporanSPBKemarin(
      {this.spbId,
      this.spbCardId,
      this.spbEstateCode,
      this.spbDivisionCode,
      this.spbLicenseNumber,
      this.spbType,
      this.spbDeliverToCode,
      this.spbDeliverToName,
      this.spbDeliveryNote,
      this.spbLat,
      this.spbLong,
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
      this.spbIsClosed,
      this.spbPhoto,
      this.spbCertificateId,
      this.createdDate,
      this.createdTime,
      this.certificationCertNoRspo,
      this.certificationCertNoIspo,
      this.certificationCertNoIscc,
      this.certificationNilaiGhgNoRspo,
      this.certificationNilaiGhgNoIspo,
      this.certificationNilaiGhgNoIscc,
      this.certificationIsccId,
      this.certificationIspoId,
      this.certificationRspoId});

  LaporanSPBKemarin.fromJson(Map<String, dynamic> json) {
    spbId = json['spb_id'];
    spbCardId = json['spb_card_id'];
    spbEstateCode = json['spb_estate_code'];
    spbDivisionCode = json['spb_division_code'];
    spbLicenseNumber = json['spb_license_number'];
    spbType = json['spb_type'];
    spbDeliverToCode = json['spb_deliver_to_code'];
    spbDeliverToName = json['spb_deliver_to_name'];
    spbDeliveryNote = json['spb_delivery_note'];
    spbLat = json['spb_lat'];
    spbLong = json['spb_long'];
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
    spbIsClosed = json['spb_is_closed'];
    spbPhoto = json['spb_photo'];
    spbCertificateId = json['spb_certificate_id'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    certificationCertNoRspo = json['certification_cert_no_rspo'];
    certificationCertNoIspo = json['certification_cert_no_ispo'];
    certificationCertNoIscc = json['certification_cert_no_iscc'];
    certificationNilaiGhgNoRspo = json['certification_nilai_ghg_no_rspo'];
    certificationNilaiGhgNoIspo = json['certification_nilai_ghg_no_ispo'];
    certificationNilaiGhgNoIscc = json['certification_nilai_ghg_no_iscc'];
    certificationIsccId = json['certification_iscc_id'];
    certificationIspoId = json['certification_ispo_id'];
    certificationRspoId = json['certification_rspo_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spb_id'] = spbId;
    data['spb_card_id'] = spbCardId;
    data['spb_estate_code'] = spbEstateCode;
    data['spb_division_code'] = spbDivisionCode;
    data['spb_license_number'] = spbLicenseNumber;
    data['spb_type'] = spbType;
    data['spb_deliver_to_code'] = spbDeliverToCode;
    data['spb_deliver_to_name'] = spbDeliverToName;
    data['spb_delivery_note'] = spbDeliveryNote;
    data['spb_lat'] = spbLat;
    data['spb_long'] = spbLong;
    data['spb_kerani_transport_employee_code'] = spbKeraniTransportEmployeeCode;
    data['spb_kerani_transport_employee_name'] = spbKeraniTransportEmployeeName;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
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
    data['spb_is_closed'] = spbIsClosed;
    data['spb_photo'] = spbPhoto;
    data['spb_certificate_id'] = spbCertificateId;
    data['certification_cert_no_rspo'] = certificationCertNoRspo;
    data['certification_cert_no_ispo'] = certificationCertNoIspo;
    data['certification_cert_no_iscc'] = certificationCertNoIscc;
    data['certification_nilai_ghg_no_rspo'] = certificationNilaiGhgNoRspo;
    data['certification_nilai_ghg_no_ispo'] = certificationNilaiGhgNoIspo;
    data['certification_nilai_ghg_no_iscc'] = certificationNilaiGhgNoIscc;
    data['certification_iscc_id'] = certificationIsccId;
    data['certification_ispo_id'] = certificationIspoId;
    data['certification_rspo_id'] = certificationRspoId;
    return data;
  }
}
