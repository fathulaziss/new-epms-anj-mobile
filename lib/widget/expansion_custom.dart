import 'package:epms/base/ui/style.dart';
import 'package:epms/base/ui/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpansionCustom extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool initiallyExpanded;
  final bool enabled;
  final List<Widget> children;

  const ExpansionCustom({
    super.key,
    required this.title,
    required this.subtitle,
    required this.initiallyExpanded,
    this.enabled = true,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        return ExpansionTile(
          title: Text(title, style: Style.textBold16),
          subtitle: Text(subtitle),
          initiallyExpanded: initiallyExpanded,
          dense: true,
          enabled: enabled,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: themeNotifier.status == true ||
                      MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          collapsedShape: RoundedRectangleBorder(
            side: BorderSide(
              color: themeNotifier.status == true ||
                      MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
          children: children,
        );
      },
    );
  }
}
