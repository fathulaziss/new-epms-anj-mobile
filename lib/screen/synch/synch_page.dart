import 'package:epms/screen/synch/synch_notifier.dart';
import 'package:epms/screen/synch/synch_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SynchPage extends StatefulWidget {
  const SynchPage({super.key});

  @override
  State<SynchPage> createState() => _SynchPageState();
}

class _SynchPageState extends State<SynchPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SynchNotifier(),
      child: const SynchScreen(),
    );
  }
}
