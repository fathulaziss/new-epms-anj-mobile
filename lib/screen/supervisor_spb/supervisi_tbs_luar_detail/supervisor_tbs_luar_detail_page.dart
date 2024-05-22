import 'package:epms/model/tbs_luar.dart';
import 'package:epms/screen/supervisor_spb/supervisi_tbs_luar_detail/supervisor_tbs_luar_detail_notifier.dart';
import 'package:epms/screen/supervisor_spb/supervisi_tbs_luar_detail/supervisor_tbs_luar_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorTBSLuarDetailPage extends StatefulWidget {
  const SupervisorTBSLuarDetailPage({
    super.key,
    this.tbsLuar,
    required this.method,
  });

  final TBSLuar? tbsLuar;
  final String method;

  @override
  State<SupervisorTBSLuarDetailPage> createState() =>
      _SupervisorTBSLuarDetailPageState();
}

class _SupervisorTBSLuarDetailPageState
    extends State<SupervisorTBSLuarDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SupervisorTBSLuarDetailNotifier(),
      child: SupervisorTBSLuarDetailScreen(
        tbsLuar: widget.tbsLuar,
        method: widget.method,
      ),
    );
  }
}
