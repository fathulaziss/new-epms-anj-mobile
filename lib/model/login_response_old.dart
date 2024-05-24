import 'package:epms/model/estate.dart';
import 'package:epms/model/global.dart';
import 'kerani_kirim.dart';

class LoginResponseOld {
  Estate? estate1;
  Estate? estate2;
  Estate? estate3;
  Global? global;
  KeraniKirim? keraniKirim;

  LoginResponseOld(
      {this.estate1, this.estate2, this.estate3, this.keraniKirim});

  LoginResponseOld.fromJson(Map<String, dynamic> json) {
    estate1 = json['0'] != null ? Estate.fromJson(json['0']) : null;
    estate2 = json['1'] != null ? Estate.fromJson(json['1']) : null;
    estate3 = json['2'] != null ? Estate.fromJson(json['2']) : null;
    global = json['global'] != null ? Global.fromJson(json['global']) : null;
    keraniKirim = json['kerani_kirim'] != null
        ? KeraniKirim.fromJson(json['kerani_kirim'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (estate1 != null) {
      data['0'] = estate1!.toJson();
    }
    if (estate2 != null) {
      data['1'] = estate2!.toJson();
    }
    if (estate3 != null) {
      data['2'] = estate3!.toJson();
    }
    if (keraniKirim != null) {
      data['kerani_kirim'] = keraniKirim!.toJson();
    }
    return data;
  }
}
