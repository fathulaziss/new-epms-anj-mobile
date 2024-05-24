class TABWSchema {
  dynamic abwId;
  String? abwCompanyCode;
  String? abwEstateCode;
  String? abwBlockCode;
  // String? abwYear;
  // String? abwMonth;
  dynamic bunchWeight;

  TABWSchema(
      {this.abwId,
      this.abwCompanyCode,
      this.abwEstateCode,
      this.abwBlockCode,
      // this.abwYear,
      // this.abwMonth,
      this.bunchWeight});

  TABWSchema.fromJson(Map<String, dynamic> json) {
    abwId = json['abw_id'];
    abwCompanyCode = json['abw_company_code'];
    abwEstateCode = json['abw_estate_code'];
    abwBlockCode = json['abw_block_code'];
    // abwYear = json['abw_year'];
    // abwMonth = json['abw_month'];
    bunchWeight = json['bunch_weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['abw_id'] = abwId;
    data['abw_company_code'] = abwCompanyCode;
    data['abw_estate_code'] = abwEstateCode;
    data['abw_block_code'] = abwBlockCode;
    // data['abw_year'] = this.abwYear;
    // data['abw_month'] = this.abwMonth;
    data['bunch_weight'] = bunchWeight;
    return data;
  }
}
