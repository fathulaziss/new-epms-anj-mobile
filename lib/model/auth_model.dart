class AuthModel {
  AuthModel({this.pin = '', this.supervisiName = ''});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        pin: json['pin'] ?? '',
        supervisiName: json["supervisi_name"] ?? '',
      );

  final String supervisiName;
  final String pin;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pin'] = pin;
    data['supervisi_name'] = supervisiName;
    return data;
  }

  @override
  String toString() {
    return 'AuthModel(pin: $pin, supervisi_name: $supervisiName)';
  }
}
