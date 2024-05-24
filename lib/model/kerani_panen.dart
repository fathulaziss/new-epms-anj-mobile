import 'package:epms/model/laporan_restan.dart';
import 'package:epms/model/t_abw_schema.dart';

import 'laporan_panen_kemarin.dart';
import 't_harvesting_plan_schema.dart';

class KeraniPanen {
  List<THarvestingPlanSchema>? tHarvestingPlanSchema;
  List<LaporanPanenKemarin>? laporanPanenKemarin;
  List<LaporanRestan>? laporanRestan;
  List<TABWSchema>? tABWSchema;

  KeraniPanen(
      {this.tHarvestingPlanSchema,
      this.laporanPanenKemarin,
      this.laporanRestan,
      this.tABWSchema});

  KeraniPanen.fromJson(Map<String, dynamic> json) {
    if (json['T_Harvesting_Plan_Schema'] != null) {
      tHarvestingPlanSchema = <THarvestingPlanSchema>[];
      json['T_Harvesting_Plan_Schema'].forEach((v) {
        tHarvestingPlanSchema!.add(THarvestingPlanSchema.fromJson(v));
      });
    }
    if (json['Laporan_Panen_Kemarin'] != null) {
      laporanPanenKemarin = <LaporanPanenKemarin>[];
      json['Laporan_Panen_Kemarin'].forEach((v) {
        laporanPanenKemarin!.add(LaporanPanenKemarin.fromJson(v));
      });
    }
    if (json['Laporan_Restan'] != null) {
      laporanRestan = <LaporanRestan>[];
      json['Laporan_Restan'].forEach((v) {
        laporanRestan!.add(LaporanRestan.fromJson(v));
      });
    }
    if (json['T_ABW_Schema'] != null) {
      tABWSchema = <TABWSchema>[];
      json['T_ABW_Schema'].forEach((v) {
        tABWSchema!.add(TABWSchema.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tHarvestingPlanSchema != null) {
      data['T_Harvesting_Plan_Schema'] =
          tHarvestingPlanSchema!.map((v) => v.toJson()).toList();
    }
    if (laporanPanenKemarin != null) {
      data['Laporan_Panen_Kemarin'] =
          laporanPanenKemarin!.map((v) => v.toJson()).toList();
    }
    if (laporanRestan != null) {
      data['Laporan_Restan'] = laporanRestan!.map((v) => v.toJson()).toList();
    }
    if (tABWSchema != null) {
      data['T_ABW_Schema'] = tABWSchema!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
