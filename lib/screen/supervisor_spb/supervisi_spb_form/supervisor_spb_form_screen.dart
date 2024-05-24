// ignore_for_file: use_build_context_synchronously

import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/screen/supervisor_spb/supervisi_spb_form/supervisor_spb_form_fruit.dart';
import 'package:epms/screen/supervisor_spb/supervisi_spb_form/supervisor_spb_form_notifier.dart';
import 'package:epms/screen/supervisor_spb/supervisi_spb_form/supervisor_spb_form_tab.dart';
import 'package:epms/screen/supervisor_spb/supervisi_tbs_luar_form/supervisor_tbs_sortasi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorSPBFormScreen extends StatefulWidget {
  const SupervisorSPBFormScreen({super.key});

  @override
  State<SupervisorSPBFormScreen> createState() =>
      _SupervisorSPBFormScreenState();
}

class _SupervisorSPBFormScreenState extends State<SupervisorSPBFormScreen> {
  @override
  void initState() {
    context.read<SupervisorSPBFormNotifier>().onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        // onWillPop: () async => NavigatorService().onWillPopForm(context),
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop == false) {
            final res = await NavigatorService().onWillPopForm(context);
            if (res) {
              Navigator.pop(context);
            }
          }
        },
        child: Consumer<SupervisorSPBFormNotifier>(
            builder: (context, notifier, child) {
          return DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: MediaQuery(
              data: Style.mediaQueryText(context),
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Supervisi SPB'),
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
                    const SupervisorSPBFormTab(),
                    notifier.sourceSPBValue == "Internal"
                        ? const SupervisorSPBFormFruit()
                        : const SupervisorTBSSortasi()
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
