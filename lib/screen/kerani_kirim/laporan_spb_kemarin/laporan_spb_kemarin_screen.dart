import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/time_manager.dart';
import 'package:epms/screen/kerani_kirim/laporan_spb_kemarin/laporan_spb_kemarin_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaporanSPBKemarinScreen extends StatefulWidget {
  const LaporanSPBKemarinScreen({super.key});

  @override
  State<LaporanSPBKemarinScreen> createState() =>
      _LaporanSPBKemarinScreenState();
}

class _LaporanSPBKemarinScreenState extends State<LaporanSPBKemarinScreen> {
  @override
  void initState() {
    context.read<LaporanSPBKemarinNotifier>().onInitLaporanSPBKemarin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LaporanSPBKemarinNotifier>(
        builder: (context, spbKemarin, child) {
      return MediaQuery(
        data: Style.mediaQueryText(context),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Laporan SPB Kemarin"),
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tanggal:"),
                      Text(TimeManager.todayWithSlash(
                          DateTime.now().subtract(const Duration(days: 1))))
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Jumlah SPB:"),
                      Text("${spbKemarin.listLaporanSPBKemarin.length}")
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Janjang:"),
                      Text("${spbKemarin.totalBunches}")
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Brondolan (Kg):"),
                      Text("${spbKemarin.totalLoosFruits}")
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Berat (Kg):"),
                      Text("${spbKemarin.totalWeight}")
                    ],
                  )
                ],
              ),
            ),
            spbKemarin.listLaporanSPBKemarin.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    height: 200,
                    child: Text(
                      "Tidak ada SPB Kemarin yang dibuat",
                      style: Style.textBold16,
                    ))
                : Flexible(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: spbKemarin.listLaporanSPBKemarin.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              spbKemarin.onClickLaporanSPBKemarin(
                                  spbKemarin.listLaporanSPBKemarin[index]);
                            },
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${spbKemarin.listLaporanSPBKemarin[index].spbId}",
                                          style: Style.textBold16),
                                      const SizedBox(height: 10),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Total Janjang:"),
                                            Text(
                                                "${spbKemarin.listLaporanSPBKemarin[index].spbTotalBunches}")
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Total Brondolan:"),
                                            Text(
                                                "${spbKemarin.listLaporanSPBKemarin[index].spbTotalLooseFruit}")
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "Truk: ${spbKemarin.listLaporanSPBKemarin[index].spbLicenseNumber}"),
                                            Text(
                                                "Kartu: ${spbKemarin.listLaporanSPBKemarin[index].spbCardId}")
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Tujuan:"),
                                            Text(
                                                "${spbKemarin.listLaporanSPBKemarin[index].spbDeliverToCode} ${spbKemarin.listLaporanSPBKemarin[index].spbDeliverToName}")
                                          ]),
                                    ]),
                              ),
                            ),
                          );
                        }),
                  )
          ]),
        ),
      );
    });
  }
}
