import 'package:epms/screen/kerani_panen/restan_report/restan_report_notifier.dart';
import 'package:epms/screen/kerani_panen/restan_report/restan_report_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RestanReportPage extends StatefulWidget {
  const RestanReportPage({super.key, required this.method});

  final String method;

  @override
  State<RestanReportPage> createState() => _RestanReportPageState();
}

class _RestanReportPageState extends State<RestanReportPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestanReportNotifier(),
      child: RestanReportScreen(method: widget.method),
    );
  }
}
