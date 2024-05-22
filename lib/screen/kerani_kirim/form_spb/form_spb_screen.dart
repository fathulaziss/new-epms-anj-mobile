// ignore_for_file: use_build_context_synchronously

import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/screen/kerani_kirim/form_spb/form_spb_detail_tab.dart';
import 'package:epms/screen/kerani_kirim/form_spb/form_spb_notifier.dart';
import 'package:epms/screen/kerani_kirim/form_spb/form_spb_oph_tab.dart';
import 'package:epms/screen/kerani_kirim/form_spb/form_spb_loader_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormSPBScreen extends StatefulWidget {
  const FormSPBScreen({super.key});

  @override
  State<FormSPBScreen> createState() => _FormSPBScreenState();
}

class _FormSPBScreenState extends State<FormSPBScreen> {
  @override
  void initState() {
    context.read<FormSPBNotifier>().onInitFormSPB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop == false) {
          final res = await NavigatorService().onWillPopForm(context);
          if (res) {
            Navigator.pop(context);
          }
        }
      },
      child: Consumer<FormSPBNotifier>(builder: (context, formSPB, child) {
        return DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: MediaQuery(
            data: Style.mediaQueryText(context),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Buat Form SPB'),
                bottom: TabBar(
                  tabs: <Widget>[
                    const Tab(
                      icon: Text("Detail"),
                    ),
                    Tab(
                      icon: Text("OPH (${formSPB.listSPBDetail.length})"),
                    ),
                    Tab(
                      icon: Text("Loader (${formSPB.spbLoaderList.length})"),
                    ),
                  ],
                ),
              ),
              body: const TabBarView(
                children: <Widget>[
                  FormSPBDetailTab(),
                  FormSPBOPHTab(),
                  FormSPBLoaderTab(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
