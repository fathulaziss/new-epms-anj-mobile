import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_oph_notifier.dart';
import 'form_oph_screen.dart';

class FormOPHPage extends StatefulWidget {
  const FormOPHPage({super.key});

  @override
  State<FormOPHPage> createState() => _FormOPHPageState();
}

class _FormOPHPageState extends State<FormOPHPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormOPHNotifier(),
      child: const FormOPHScreen(),
    );
  }
}
