import 'package:epms/model/oph.dart';
import 'package:epms/screen/kerani_panen/detail_oph/detail_oph_notifier.dart';
import 'package:epms/screen/kerani_panen/detail_oph/detail_oph_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailOPHPage extends StatefulWidget {
  const DetailOPHPage({
    super.key,
    required this.oph,
    required this.method,
    required this.restan,
  });

  final OPH oph;
  final String method;
  final bool restan;

  @override
  State<DetailOPHPage> createState() => _DetailOPHPageState();
}

class _DetailOPHPageState extends State<DetailOPHPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailOPHNotifier(),
      child: DetailOPHScreen(
        oph: widget.oph,
        method: widget.method,
        restan: widget.restan,
      ),
    );
  }
}
