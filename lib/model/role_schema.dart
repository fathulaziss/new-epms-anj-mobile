class RolesSchema {
  dynamic userId;
  String? userRoles;

  RolesSchema({this.userId, this.userRoles});

  RolesSchema.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userRoles = json['user_roles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_roles'] = userRoles;
    return data;
  }
}
