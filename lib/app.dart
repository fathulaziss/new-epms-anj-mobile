import 'package:epms/base/common/locator.dart';
import 'package:epms/base/common/routes.dart';
import 'package:epms/base/common/routes_manager.dart' as router;
import 'package:epms/base/ui/screen_style.dart';
import 'package:epms/base/ui/theme_notifier.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/screen/splash/splash_screen.dart';
import 'package:epms/widget/manager_dialog.dart' as dialog;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void start() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => ThemeNotifier()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, child) => MaterialApp(
          theme: theme.getTheme(),
          darkTheme: theme.darkTheme,
          debugShowCheckedModeBanner: false,
          navigatorKey: locator<NavigatorService>().navigatorKey,
          onGenerateRoute: router.generateRoute,
          initialRoute: Routes.ROOT,
          builder: (context, child) {
            child = dialog.builderDialog(context, child);
            child = ScreenStyle.responsiveBuilder(context, child);
            return child;
          },
          home: SplashScreen(),
        ),
      ),
    );
  }
}
