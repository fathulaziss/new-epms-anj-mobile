class MConfigSchema {
  String? userToken;
  String? userLogin;
  String? employeeCode;
  String? employeeName;
  dynamic userId;
  String? serverDate;
  String? serverTime;
  dynamic configId;
  String? companyCode;
  String? companyName;
  String? profileCode;
  String? profileName;
  String? estateCode;
  String? estateName;
  String? plantCode;
  String? createdBy;
  String? createdDate;
  String? createdTime;
  String? updatedBy;
  String? updatedDate;
  String? updatedTime;
  dynamic configIdOld;
  String? loginDate;
  String? loginTime;
  String? apiRoot;

  MConfigSchema(
      {this.userToken,
      this.userLogin,
      this.employeeCode,
      this.employeeName,
      this.userId,
      this.serverDate,
      this.serverTime,
      this.configId,
      this.companyCode,
      this.companyName,
      this.profileCode,
      this.profileName,
      this.estateCode,
      this.estateName,
      this.plantCode,
      this.createdBy,
      this.createdDate,
      this.createdTime,
      this.updatedBy,
      this.updatedDate,
      this.updatedTime,
      this.configIdOld,
      this.loginDate,
      this.loginTime,
      this.apiRoot});

  MConfigSchema.fromJson(Map<String, dynamic> json) {
    userToken = json['user_token'];
    userLogin = json['user_login'];
    employeeCode = json['employee_code'];
    employeeName = json['employee_name'];
    userId = json['user_id'];
    serverDate = json['server_date'];
    serverTime = json['server_time'];
    configId = json['config_id'];
    companyCode = json['company_code'];
    companyName = json['company_name'];
    profileCode = json['profile_code'];
    profileName = json['profile_name'];
    estateCode = json['estate_code'];
    estateName = json['estate_name'];
    plantCode = json['plant_code'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    updatedTime = json['updated_time'];
    configIdOld = json['config_id_old'];
    loginDate = json['login_date'];
    loginTime = json['login_time'];
    apiRoot = json['api_root'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_token'] = userToken;
    data['user_login'] = userLogin;
    data['employee_code'] = employeeCode;
    data['employee_name'] = employeeName;
    data['user_id'] = userId;
    data['server_date'] = serverDate;
    data['server_time'] = serverTime;
    data['config_id'] = configId;
    data['company_code'] = companyCode;
    data['company_name'] = companyName;
    data['profile_code'] = profileCode;
    data['profile_name'] = profileName;
    data['estate_code'] = estateCode;
    data['estate_name'] = estateName;
    data['plant_code'] = plantCode;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['created_time'] = createdTime;
    data['updated_by'] = updatedBy;
    data['updated_date'] = updatedDate;
    data['updated_time'] = updatedTime;
    data['config_id_old'] = configIdOld;
    data['login_date'] = loginDate;
    data['login_time'] = loginTime;
    data['api_root'] = apiRoot;
    return data;
  }
}
