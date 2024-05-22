class Estate {
  String? estateCode;
  String? estateDb;

  Estate({this.estateCode, this.estateDb});

  Estate.fromJson(Map<String, dynamic> json) {
    estateCode = json['estate_code'];
    estateDb = json['estate_db'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['estate_code'] = estateCode;
    data['estate_db'] = estateDb;
    return data;
  }
}
