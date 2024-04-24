import 'package:epms/app.dart';
import 'package:epms/app_config.dart';
import 'package:epms/enum.dart';
import 'package:flutter/material.dart';

Future<void> setupApp({
  bool isProduction = false,
  bool isDevelopment = false,
  bool isStaging = false,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.appFlavor = isProduction ? Flavor.production : Flavor.development;
  // await initFirebase();
  start();
}

// Future<void> initFirebase() async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await FirebaseService().initializeFirebaseMessaging();
//   // await FirebaseService().initializeFirebaseMessagingHandler();
// }
