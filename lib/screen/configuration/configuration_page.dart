import 'package:epms/screen/configuration/configuration_notifier.dart';
import 'package:epms/screen/configuration/configuration_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ConfigurationNotifier(),
      child: const ConfigurationScreen(),
    );
  }
}
