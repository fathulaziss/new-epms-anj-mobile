import 'package:epms/screen/supervisor_form/supervisor_form_notifier.dart';
import 'package:epms/screen/supervisor_form/supervisor_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorFormPage extends StatefulWidget {
  const SupervisorFormPage({super.key, this.form});

  final String? form;

  @override
  State<SupervisorFormPage> createState() => _SupervisorFormPageState();
}

class _SupervisorFormPageState extends State<SupervisorFormPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SupervisorFormNotifier(),
      child: SupervisorFormScreen(form: widget.form),
    );
  }
}
