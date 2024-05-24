// ignore_for_file: use_build_context_synchronously

import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/model/oph_supervise_ancak.dart';
import 'package:epms/screen/supervisor/detail_supervise_ancak_harvest/detail_supervisor_ancak_fruit.dart';
import 'package:epms/screen/supervisor/detail_supervise_ancak_harvest/detail_supervisor_ancak_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_supervisor_ancak_tab.dart';
import 'edit_supervisor_ancak_fruit.dart';

class DetailSuperviseAncakHarvestScreen extends StatefulWidget {
  const DetailSuperviseAncakHarvestScreen({
    super.key,
    required this.ophSuperviseAncak,
  });

  final OPHSuperviseAncak ophSuperviseAncak;

  @override
  State<DetailSuperviseAncakHarvestScreen> createState() =>
      _DetailSuperviseAncakHarvestScreenState();
}

class _DetailSuperviseAncakHarvestScreenState
    extends State<DetailSuperviseAncakHarvestScreen> {
  @override
  void initState() {
    context
        .read<DetailSupervisorAncakNotifier>()
        .onInit(widget.ophSuperviseAncak);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailSupervisorAncakNotifier>(
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
                title: const Text('Detail Laporan Supervisi Ancak Panen'),
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
                  const DetailSupervisorAncakTab(),
                  notifier.onEdit
                      ? const EditSupervisorAncakFormFruit()
                      : const DetailSupervisorAncakFormFruit()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
