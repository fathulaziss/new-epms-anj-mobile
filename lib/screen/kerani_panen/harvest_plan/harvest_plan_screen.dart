import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/time_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'harvest_plan_notifier.dart';

class HarvestPlanScreen extends StatefulWidget {
  const HarvestPlanScreen({super.key});

  @override
  State<HarvestPlanScreen> createState() => _HarvestPlanScreenState();
}

class _HarvestPlanScreenState extends State<HarvestPlanScreen> {
  @override
  void initState() {
    context.read<HarvestPlanNotifier>().getListHarvestPlan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HarvestPlanNotifier>(
        builder: (context, harvestPlan, child) {
      return MediaQuery(
        data: Style.mediaQueryText(context),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Rencana Panen Hari Ini"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tanggal:"),
                  Text(TimeManager.todayWithSlash(DateTime.now()))
                ],
              ),
              const SizedBox(height: 30),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: const <TableRow>[
                  TableRow(
                    children: <Widget>[
                      SizedBox(
                        width: 110,
                        child: Column(children: [
                          Text("Divisi/Blok"),
                          SizedBox(height: 8),
                        ]),
                      ),
                      SizedBox(
                        width: 110,
                        child: Column(children: [
                          Text("Hektar"),
                          SizedBox(height: 8),
                        ]),
                      ),
                      SizedBox(
                        width: 110,
                        child: Column(children: [
                          Text("Total HK"),
                          SizedBox(height: 8),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              harvestPlan.listHarvestingPlanSchema.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      height: 200,
                      child: Text(
                        "Tidak ada rencana panen hari ini",
                        style: Style.textBold14,
                      ))
                  : Flexible(
                      child: ListView.builder(
                          itemCount:
                              harvestPlan.listHarvestingPlanSchema.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: <TableRow>[
                                    TableRow(
                                      children: <Widget>[
                                        Container(
                                          width: 90,
                                          alignment: Alignment.center,
                                          child: Text(
                                              "${harvestPlan.listHarvestingPlanSchema[index].harvestingPlanDivisionCode}/${harvestPlan.listHarvestingPlanSchema[index].harvestingPlanBlockCode}"),
                                        ),
                                        Container(
                                          width: 90,
                                          alignment: Alignment.center,
                                          child: Text(
                                              "${harvestPlan.listHarvestingPlanSchema[index].harvestingPlanHectarage}"),
                                        ),
                                        Container(
                                          width: 90,
                                          alignment: Alignment.center,
                                          child: Text(
                                              "${harvestPlan.listHarvestingPlanSchema[index].harvestingPlanTotalHk}"),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider()
                              ],
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
