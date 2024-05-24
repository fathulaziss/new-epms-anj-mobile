import 'package:epms/model/laporan_spb_kemarin.dart';

import 'laporan_restan.dart';

class KeraniKirim {
  List<LaporanSPBKemarin>? laporanSPBKemarin;
  List<LaporanRestan>? laporanRestan;

  KeraniKirim({this.laporanRestan});

  KeraniKirim.fromJson(Map<String, dynamic> json) {
    if (json['Laporan_SPB_Kemarin'] != null) {
      laporanSPBKemarin = <LaporanSPBKemarin>[];
      json['Laporan_SPB_Kemarin'].forEach((v) {
        laporanSPBKemarin!.add(LaporanSPBKemarin.fromJson(v));
      });
    }
    if (json['Laporan_Restan'] != null) {
      laporanRestan = <LaporanRestan>[];
      json['Laporan_Restan'].forEach((v) {
        laporanRestan!.add(LaporanRestan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (laporanSPBKemarin != null) {
      data['Laporan_SPB_Kemarin'] =
          laporanSPBKemarin!.map((v) => v.toJson()).toList();
    }
    if (laporanRestan != null) {
      data['Laporan_Restan'] = laporanRestan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
