import 'package:epms/model/spb.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_spb_notifier.dart';
import 'detail_spb_screen.dart';

class DetailSPBPage extends StatefulWidget {
  const DetailSPBPage({super.key, required this.spb, required this.method});

  final String method;
  final SPB spb;

  @override
  State<DetailSPBPage> createState() => _DetailSPBPageState();
}

class _DetailSPBPageState extends State<DetailSPBPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailSPBNotifier(),
      child: DetailSPBScreen(spb: widget.spb, method: widget.method),
    );
  }
}
