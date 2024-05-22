import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'harvest_plan_notifier.dart';
import 'harvest_plan_screen.dart';

class HarvestPlanPage extends StatefulWidget {
  const HarvestPlanPage({super.key});

  @override
  State<HarvestPlanPage> createState() => _HarvestPlanPageState();
}

class _HarvestPlanPageState extends State<HarvestPlanPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HarvestPlanNotifier(),
      child: const HarvestPlanScreen(),
    );
  }
}
