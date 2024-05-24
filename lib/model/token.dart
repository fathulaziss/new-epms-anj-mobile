class Token {
  String? id;
  String? token;
  String? username;

  Token({this.id, this.token, this.username});

  Token.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    data['username'] = username;
    return data;
  }
}
