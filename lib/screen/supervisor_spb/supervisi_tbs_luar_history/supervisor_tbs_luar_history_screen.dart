import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/time_manager.dart';
import 'package:epms/screen/supervisor_spb/supervisi_tbs_luar_history/supervisor_tbs_luar_history_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorTBSLuarHistoryScreen extends StatefulWidget {
  const SupervisorTBSLuarHistoryScreen({super.key});

  @override
  State<SupervisorTBSLuarHistoryScreen> createState() =>
      _SupervisorTBSLuarHistoryScreenState();
}

class _SupervisorTBSLuarHistoryScreenState
    extends State<SupervisorTBSLuarHistoryScreen> {
  @override
  void initState() {
    context.read<SupervisorTBSLuarHistoryNotifier>().onInit();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorTBSLuarHistoryNotifier>(
      builder: (context, notifier, child) {
        return MediaQuery(
          data: Style.mediaQueryText(context),
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Laporan Supervisi TBS Luar"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Tanggal:"),
                          Text(TimeManager.dateWithDash(DateTime.now()))
                        ],
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                if (notifier.listTBSLuarSupervise.isEmpty)
                  Container(
                      alignment: Alignment.center,
                      height: 200,
                      child: Text(
                        "Tidak ada Supervisi TBS\nLuar yang dibuat",
                        style: Style.textBold16,
                        textAlign: TextAlign.center,
                      ))
                else
                  Flexible(
                    child: ListView.builder(
                        itemCount: notifier.listTBSLuarSupervise.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              notifier.onSelectedTBSLuar(
                                  notifier.listTBSLuarSupervise[index],
                                  "DETAIL");
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${notifier.listTBSLuarSupervise[index].spdID}",
                                        style: Style.textBold16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Total Janjang:"),
                                      Text(
                                          "${notifier.listTBSLuarSupervise[index].bunchesTotal} Janjang"),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Potongan:"),
                                      Text(
                                          "${notifier.listTBSLuarSupervise[index].deduction} Janjang"),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Supir:"),
                                      Text(
                                          "${notifier.listTBSLuarSupervise[index].driverName}")
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("No Kendaraan:"),
                                        Text(
                                            "${notifier.listTBSLuarSupervise[index].licenseNumber} "),
                                      ]),
                                  const SizedBox(height: 8),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "Tanggal: ${notifier.listTBSLuarSupervise[index].createdDate} "),
                                        Text(
                                            "Waktu: ${notifier.listTBSLuarSupervise[index].createdTime}"),
                                      ]),
                                ]),
                              ),
                            ),
                          );
                        }),
                  )
              ]),
            ),
          ),
        );
      },
    );
  }
}
