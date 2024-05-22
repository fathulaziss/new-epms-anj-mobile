import 'package:epms/model/global.dart';
import 'package:epms/model/kerani_kirim.dart';
import 'package:epms/model/kerani_model.dart';
import 'package:epms/model/kerani_panen.dart';
import 'package:epms/model/supervisi.dart';
import 'package:epms/model/supervisi_3rd_party.dart';

class SynchResponse {
  String? message;
  Global? global;
  KeraniPanen? keraniPanen;
  KeraniKirim? keraniKirim;
  KeraniModel? kerani;
  Supervisi? supervisi;
  List<Supervisi3rdParty>? supervisi3rdParty;
  List? ophHistory;
  String? serverDate;
  String? serverTime;

  SynchResponse({
    this.message,
    this.global,
    this.keraniPanen,
    this.keraniKirim,
    this.kerani,
    this.supervisi,
    this.supervisi3rdParty,
    this.ophHistory,
    this.serverDate,
    this.serverTime,
  });

  SynchResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    global = json['global'] != null ? Global.fromJson(json['global']) : null;
    keraniPanen = json['kerani_panen'] != null
        ? KeraniPanen.fromJson(json['kerani_panen'])
        : null;
    keraniKirim = json['kerani_kirim'] != null
        ? KeraniKirim.fromJson(json['kerani_kirim'])
        : null;
    kerani =
        json['kerani'] != null ? KeraniModel.fromJson(json['kerani']) : null;
    supervisi = json['supervisi'] != null
        ? Supervisi.fromJson(json['supervisi'])
        : null;
    if (json['supervisi_3rd_party'] != null) {
      supervisi3rdParty = <Supervisi3rdParty>[];
      json['supervisi_3rd_party'].forEach((v) {
        supervisi3rdParty!.add(Supervisi3rdParty.fromJson(v));
      });
    }
    ophHistory = json['oph_history'] ?? [];
    serverDate = json['server_date'] ?? '';
    serverTime = json['server_time'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (global != null) {
      data['global'] = global!.toJson();
    }
    if (keraniPanen != null) {
      data['kerani_panen'] = keraniPanen!.toJson();
    }
    if (keraniKirim != null) {
      data['kerani_kirim'] = keraniKirim!.toJson();
    }
    if (kerani != null) {
      data['kerani'] = kerani!.toJson();
    }
    if (supervisi != null) {
      data['supervisi'] = supervisi!.toJson();
    }
    if (supervisi3rdParty != null) {
      data['supervisi_3rd_party'] =
          supervisi3rdParty!.map((v) => v.toJson()).toList();
    }
    if (ophHistory != null) {
      data['oph_history'] = ophHistory!.map((e) => e).toList();
    }
    if (serverDate != null) {
      data['server_date'] = serverDate;
    }
    if (serverTime != null) {
      data['server_time'] = serverTime;
    }
    return data;
  }
}
