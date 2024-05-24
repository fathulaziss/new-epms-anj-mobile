class LoginResponse {
  String? userToken;
  String? userLogin;
  dynamic userId;
  String? serverDate;
  String? serverTime;
  dynamic configId;
  String? millCode;
  String? companyCode;
  String? companyName;
  String? employeeCode;
  String? employeeName;
  String? mCompanyId;
  String? profileCode;
  String? profileName;
  String? estateCode;
  String? estateName;
  String? userRole;
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

  LoginResponse(
      {this.userToken,
      this.userLogin,
      this.userId,
      this.serverDate,
      this.serverTime,
      this.configId,
      this.millCode,
      this.companyCode,
      this.companyName,
      this.employeeCode,
      this.employeeName,
      this.mCompanyId,
      this.profileCode,
      this.profileName,
      this.estateCode,
      this.estateName,
      this.plantCode,
      this.userRole,
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

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userToken = json['user_token'];
    userLogin = json['user_login'];
    userId = json['user_id'];
    serverDate = json['server_date'];
    serverTime = json['server_time'];
    configId = json['config_id'];
    millCode = json['mill_code'];
    employeeName = json['employee_name'];
    employeeCode = json['employee_code'];
    mCompanyId = json['m_company_id'];
    companyCode = json['company_code'];
    companyName = json['company_name'];
    profileCode = json['profile_code'];
    profileName = json['profile_name'];
    estateCode = json['estate_code'];
    estateName = json['estate_name'];
    plantCode = json['plant_code'];
    userRole = json['user_role'];
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
    data['user_id'] = userId;
    data['server_date'] = serverDate;
    data['server_time'] = serverTime;
    data['config_id'] = configId;
    // data['mill_code'] = this.millCode;
    data['company_code'] = companyCode;
    data['company_name'] = companyName;
    data['employee_name'] = employeeName;
    data['employee_code'] = employeeCode;
    data['m_company_id'] = mCompanyId;
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
