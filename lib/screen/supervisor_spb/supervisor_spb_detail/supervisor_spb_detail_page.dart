import 'package:epms/model/spb_supervise.dart';
import 'package:epms/screen/supervisor_spb/supervisor_spb_detail/supervisor_spb_detail_notifier.dart';
import 'package:epms/screen/supervisor_spb/supervisor_spb_detail/supervisor_spb_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorSPBDetailPage extends StatefulWidget {
  const SupervisorSPBDetailPage({super.key, required this.spbSupervise});

  final SPBSupervise spbSupervise;

  @override
  State<SupervisorSPBDetailPage> createState() =>
      _SupervisorSPBDetailPageState();
}

class _SupervisorSPBDetailPageState extends State<SupervisorSPBDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SupervisorSPBDetailNotifier(),
      child: SupervisorSPBDetailScreen(spbSupervise: widget.spbSupervise),
    );
  }
}
