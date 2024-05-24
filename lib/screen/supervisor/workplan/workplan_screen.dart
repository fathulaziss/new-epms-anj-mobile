import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/time_manager.dart';
import 'package:epms/screen/supervisor/workplan/workplan_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkPlanScreen extends StatefulWidget {
  const WorkPlanScreen({super.key});

  @override
  State<WorkPlanScreen> createState() => _WorkPlanScreenState();
}

class _WorkPlanScreenState extends State<WorkPlanScreen> {
  @override
  void initState() {
    context.read<WorkPlanNotifier>().onInit();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkPlanNotifier>(builder: (context, notifier, child) {
      return MediaQuery(
        data: Style.mediaQueryText(context),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Work Plan Hari Ini"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tanggal:"),
                  Text(TimeManager.todayWithSlash(DateTime.now()))
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Jumlah Workplan:"),
                  Text("${notifier.listWorkPlan.length}")
                ],
              ),
              const SizedBox(height: 14),
              notifier.listWorkPlan.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      height: 200,
                      child: Text(
                        "Tidak ada rencana kerja hari ini",
                        style: Style.textBold14,
                      ))
                  : Flexible(
                      child: ListView.builder(
                          itemCount: notifier.listWorkPlan.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "${notifier.listWorkPlan[index].workplanActivityCode}",
                                            style: Style.textBold14),
                                        Text(
                                            "Total HK: ${notifier.listWorkPlan[index].workplanTotalHk}")
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${notifier.listWorkPlan[index].workplanActivityName}",
                                      style: Style.textBold14,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "Divisi: ${notifier.listWorkPlan[index].workplanDivisionCode}"),
                                        Text(
                                            "Blok: ${notifier.listWorkPlan[index].workplanBlockCode}")
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            const Text("Remark:"),
                                            Text(
                                                "${notifier.listWorkPlan[index].workplanRemark}")
                                          ],
                                        ),
                                        Text(
                                            "Target: ${notifier.listWorkPlan[index].workplanTarget} H")
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Jumlah Material:"),
                                        Text(
                                            "${notifier.listWorkPlan[index].materials?.length ?? 0}")
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: notifier
                                                      .listWorkPlan[index]
                                                      .materials !=
                                                  null
                                              ? notifier.listWorkPlan[index]
                                                  .materials?.length
                                              : 0,
                                          itemBuilder: (BuildContext context,
                                              int indexInt) {
                                            return Card(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("Nama material:"),
                                                  Text(
                                                      "${notifier.listWorkPlan[index].materials?[indexInt].workplanMaterialName}"),
                                                  const SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                          "Kuantitas Material:"),
                                                      Text(
                                                          "${notifier.listWorkPlan[index].materials?[indexInt].workplanMaterialQty} ${notifier.listWorkPlan[index].materials?[indexInt].workplanMaterialUom}"),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ));
                                          }),
                                    ),
                                  ],
                                ),
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
