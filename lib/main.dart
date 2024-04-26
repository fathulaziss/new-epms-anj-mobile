import 'package:epms/app.dart';
import 'package:epms/app_config.dart';
import 'package:epms/base/api/firebase_api.dart';
import 'package:epms/base/common/locator.dart';
import 'package:epms/enum.dart';
import 'package:epms/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> setupApp({
  bool isProduction = false,
  bool isDevelopment = false,
  bool isStaging = false,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.appFlavor = isProduction ? Flavor.production : Flavor.development;
  await initFirebase();
  await setupLocator();
  start();
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  // await FirebaseService().initializeFirebaseMessagingHandler();
}
