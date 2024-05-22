import 'package:epms/screen/kerani_panen/history_oph/history_oph_notifier.dart';
import 'package:epms/screen/kerani_panen/history_oph/history_oph_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryOPHPage extends StatefulWidget {
  const HistoryOPHPage({super.key, required this.method});

  final String method;

  @override
  State<HistoryOPHPage> createState() => _HistoryOPHPageState();
}

class _HistoryOPHPageState extends State<HistoryOPHPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryOPHNotifier(),
      child: HistoryOPHScreen(method: widget.method),
    );
  }
}
