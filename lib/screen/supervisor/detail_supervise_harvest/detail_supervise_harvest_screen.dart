// ignore_for_file: use_build_context_synchronously

import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/model/oph_supervise.dart';
import 'package:epms/screen/supervisor/detail_supervise_harvest/detail_supervise_harvest_notifier.dart';
import 'package:epms/screen/supervisor/detail_supervise_harvest/supervise_harvest_detail_edit_fruit.dart';
import 'package:epms/screen/supervisor/detail_supervise_harvest/supervise_harvest_detail_tab.dart';
import 'package:epms/screen/supervisor/detail_supervise_harvest/supervisor_harvest_detail_fruit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailSuperviseHarvestScreen extends StatefulWidget {
  const DetailSuperviseHarvestScreen({super.key, required this.ophSupervise});

  final OPHSupervise ophSupervise;

  @override
  State<DetailSuperviseHarvestScreen> createState() =>
      _DetailSuperviseHarvestScreenState();
}

class _DetailSuperviseHarvestScreenState
    extends State<DetailSuperviseHarvestScreen> {
  @override
  void initState() {
    context.read<DetailSuperviseHarvestNotifier>().onInit(widget.ophSupervise);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailSuperviseHarvestNotifier>(
        builder: (context, notifier, child) {
      return PopScope(
        // onWillPop: () async {
        //   if (notifier.onEdit) {
        //     return NavigatorService().onWillPopForm(context);
        //   } else {
        //     return true;
        //   }
        // },
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop == false) {
            if (notifier.onEdit) {
              final res = await NavigatorService().onWillPopForm(context);
              if (res) {
                Navigator.pop(context);
              }
            } else {
              Navigator.pop(context);
            }
          }
        },
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: MediaQuery(
            data: Style.mediaQueryText(context),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Detail Laporan Supervisi'),
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      icon: Text("Form"),
                    ),
                    Tab(
                      icon: Text("Hasil"),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  const SuperviseHarvestDetailTab(),
                  notifier.onEdit
                      ? const SuperviseDetailEditFruit()
                      : const SuperviseHarvestDetailFruit()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
