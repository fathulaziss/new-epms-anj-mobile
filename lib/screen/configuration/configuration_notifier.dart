// ignore_for_file: avoid_print

import 'package:epms/base/common/locator.dart';
import 'package:epms/common_manager/dialog_services.dart';
import 'package:epms/common_manager/flushbar_manager.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/common_manager/storage_manager.dart';
import 'package:flutter/material.dart';

class ConfigurationNotifier extends ChangeNotifier {
  final NavigatorService _navigationService = locator<NavigatorService>();

  NavigatorService get navigationService => _navigationService;

  final DialogService _dialogService = locator<DialogService>();

  DialogService get dialogService => _dialogService;

  final TextEditingController _apiServer = TextEditingController();

  TextEditingController get apiServer => _apiServer;

  final TextEditingController _database = TextEditingController();

  TextEditingController get database => _database;

  onInitConfiguration() async {
    String? apiServerTemp = await StorageManager.readData("apiServer");
    if (apiServerTemp == null) {
      // _apiServer.text = APIEndPoint.BASE_URL;
    } else {
      _apiServer.text = apiServerTemp;
    }
    notifyListeners();
  }

  doSaveButton(BuildContext context, String apiServer, String database) {
    try {
      if (apiServer.isNotEmpty) {
        StorageManager.saveData("apiServer", apiServer);
      } else {
        StorageManager.deleteData("apiServer");
      }

      _navigationService.pop();
      FlushBarManager.showFlushBarSuccess(
          context, "Konfigurasi server", "Berhasil");
    } catch (e) {
      print("Save api server error");
    }
  }
}
