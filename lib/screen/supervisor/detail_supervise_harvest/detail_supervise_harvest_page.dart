import 'package:epms/model/oph_supervise.dart';
import 'package:epms/screen/supervisor/detail_supervise_harvest/detail_supervise_harvest_notifier.dart';
import 'package:epms/screen/supervisor/detail_supervise_harvest/detail_supervise_harvest_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailSuperviseHarvestPage extends StatefulWidget {
  const DetailSuperviseHarvestPage({super.key, required this.ophSupervise});

  final OPHSupervise ophSupervise;

  @override
  State<DetailSuperviseHarvestPage> createState() =>
      _DetailSuperviseHarvestPageState();
}

class _DetailSuperviseHarvestPageState
    extends State<DetailSuperviseHarvestPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailSuperviseHarvestNotifier(),
      child: DetailSuperviseHarvestScreen(ophSupervise: widget.ophSupervise),
    );
  }
}
