class LaporanPanenKemarin {
  String? employeeCode;
  String? employeeName;
  int? bunchesRipe;
  int? bunchesOverripe;
  int? bunchesHalfripe;
  int? bunchesUnripe;
  int? bunchesAbnormal;
  int? bunchesEmpty;
  int? looseFruits;
  int? bunchesTotal;
  int? bunchesNotSent;
  String? createdDate;

  LaporanPanenKemarin(
      {this.employeeCode,
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
      this.createdDate});

  LaporanPanenKemarin.fromJson(Map<String, dynamic> json) {
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
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['created_date'] = createdDate;
    return data;
  }
}
