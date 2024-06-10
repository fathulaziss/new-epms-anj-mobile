// ignore_for_file: avoid_print

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class ConnectionManager {
  Future<List<ConnectivityResult>> checkConnection() async {
    try {
      final result = await (Connectivity().checkConnectivity());
      return result;
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status $e');
      return <ConnectivityResult>[ConnectivityResult.none];
    }
  }
}
