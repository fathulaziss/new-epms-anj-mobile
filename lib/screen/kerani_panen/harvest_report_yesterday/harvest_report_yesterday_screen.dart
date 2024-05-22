import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/value_service.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'harvest_report_yesterday_notifier.dart';

class HarvestReportYesterdayScreen extends StatefulWidget {
  const HarvestReportYesterdayScreen({super.key});

  @override
  State<HarvestReportYesterdayScreen> createState() =>
      _HarvestReportYesterdayScreenState();
}

class _HarvestReportYesterdayScreenState
    extends State<HarvestReportYesterdayScreen> {
  @override
  void initState() {
    context.read<HarvestReportYesterdayNotifier>().getListLaporanPanenKemarin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HarvestReportYesterdayNotifier>(
        builder: (context, laporanKemarin, child) {
      return MediaQuery(
        data: Style.mediaQueryText(context),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Laporan Panen Harian"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(child: Text("Tanggal:")),
                        Flexible(
                          child: SizedBox(
                            width: 180,
                            child: DropdownButton(
                              isExpanded: true,
                              value: laporanKemarin.dateFilterValue,
                              items: laporanKemarin.dateFilter.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                laporanKemarin.onSetDateFilter(value!);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah pemanen:"),
                        Text("${laporanKemarin.totalHarvester}")
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Janjang:"),
                        Text(ValueService.thousandSeparator(
                            laporanKemarin.totalBunches))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Brondolan (Kg):"),
                        Text(ValueService.thousandSeparator(
                            laporanKemarin.totalLooseFruits))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah janjang masak:"),
                        Text(ValueService.thousandSeparator(
                            laporanKemarin.totalBunchesRipe))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah janjang lewat masak:"),
                        Text(ValueService.thousandSeparator(
                            laporanKemarin.totalBunchesOverRipe))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah janjang mengkal:"),
                        Text(ValueService.thousandSeparator(
                            laporanKemarin.totalBunchesHalfRipe))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah janjang mentah:"),
                        Text(ValueService.thousandSeparator(
                            laporanKemarin.totalBunchesUnRipe))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah janjang tidak normal:"),
                        Text(ValueService.thousandSeparator(
                            laporanKemarin.totalBunchesAbNormal))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah janjang kosong:"),
                        Text(ValueService.thousandSeparator(
                            laporanKemarin.totalBunchesEmpty))
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah janjang tidak dikirim:"),
                        Text(ValueService.thousandSeparator(
                            laporanKemarin.totalBunchesNotSent))
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              laporanKemarin.listResult.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      height: 200,
                      child: Text("Tidak ada OPH yang dibuat hari ini",
                          style: Style.textBold14),
                    )
                  : Flexible(
                      child: ListView.builder(
                          itemCount: laporanKemarin.listResult.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 2, bottom: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Palette.primaryColorProd)),
                              child: ExpandablePanel(
                                header: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "${laporanKemarin.listResult[index].employeeCode ?? ""} ${laporanKemarin.listResult[index].employeeName ?? ""}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                expanded: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Table(
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          children: <TableRow>[
                                            const TableRow(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text("Masak"),
                                                    SizedBox(height: 8),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text("Lewat Masak"),
                                                    SizedBox(height: 8),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text("Mengkal"),
                                                    SizedBox(height: 8),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text(
                                                      "${laporanKemarin.listResult[index].bunchesRipe}",
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(height: 16),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text(
                                                      "${laporanKemarin.listResult[index].bunchesOverripe}",
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(height: 16),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text(
                                                      "${laporanKemarin.listResult[index].bunchesHalfripe}",
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                    const SizedBox(height: 16),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            const TableRow(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text("Mentah"),
                                                    SizedBox(height: 8),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text("Tidak Normal"),
                                                    SizedBox(height: 8),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text("Janjang Kosong"),
                                                    SizedBox(height: 8),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text(
                                                        "${laporanKemarin.listResult[index].bunchesUnripe}",
                                                        style: const TextStyle(
                                                            fontSize: 18)),
                                                    const SizedBox(height: 16),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text(
                                                        "${laporanKemarin.listResult[index].bunchesAbnormal}",
                                                        style: const TextStyle(
                                                            fontSize: 18)),
                                                    const SizedBox(height: 16),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text(
                                                        "${laporanKemarin.listResult[index].bunchesEmpty}",
                                                        style: const TextStyle(
                                                            fontSize: 18)),
                                                    const SizedBox(height: 16),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            const TableRow(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text("Total Janjang"),
                                                    SizedBox(height: 8),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text("Brondolan (Kg)"),
                                                    SizedBox(height: 8),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    SizedBox(
                                                        width: 100,
                                                        child: Text(
                                                          "Janjang Tidak Dikirim",
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                    SizedBox(height: 8),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text(
                                                        "${laporanKemarin.listResult[index].bunchesTotal}",
                                                        style: const TextStyle(
                                                            fontSize: 18)),
                                                    const SizedBox(height: 16),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text(
                                                        "${laporanKemarin.listResult[index].looseFruits}",
                                                        style: const TextStyle(
                                                            fontSize: 18)),
                                                    const SizedBox(height: 16),
                                                  ]),
                                                ),
                                                SizedBox(
                                                  width: 110,
                                                  child: Column(children: [
                                                    Text(
                                                        "${laporanKemarin.listResult[index].bunchesNotSent}",
                                                        style: const TextStyle(
                                                            fontSize: 18)),
                                                    const SizedBox(height: 16),
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                                collapsed: Container(),
                              ),
                            );
                          }),
                    ),
            ]),
          ),
        ),
      );
    });
  }
}
