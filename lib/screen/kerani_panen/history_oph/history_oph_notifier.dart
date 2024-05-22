import 'package:epms/base/common/locator.dart';
import 'package:epms/base/common/routes.dart';
import 'package:epms/common_manager/dialog_services.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/database/service/database_oph.dart';
import 'package:epms/model/oph.dart';
import 'package:flutter/material.dart';

class HistoryOPHNotifier extends ChangeNotifier {
  final NavigatorService _navigationService = locator<NavigatorService>();

  NavigatorService get navigationService => _navigationService;

  final DialogService _dialogService = locator<DialogService>();

  DialogService get dialogService => _dialogService;

  List<OPH> _listOPH = [];

  List<OPH> get listOPH => _listOPH;

  final List<OPH> _listOPHResult = [];

  List<OPH> get listOPHResult => _listOPHResult;

  final List<String> _blockList = ["Semua"];

  List<String> get blockList => _blockList;

  String _filterBlockValue = "Semua";

  String get filterBlockValue => _filterBlockValue;

  dynamic _totalBunches = 0;

  dynamic get totalBunches => _totalBunches;

  dynamic _totalLooseFruits = 0;

  dynamic get totalLooseFruits => _totalLooseFruits;

  dynamic _countOPH = 0;

  dynamic get countOPH => _countOPH;

  getListOPH() async {
    List<String> listBlockTemp = [];
    _listOPH = await DatabaseOPH().selectOPH();
    for (var element in _listOPH) {
      _totalBunches = _totalBunches + element.bunchesTotal;
      _totalLooseFruits = _totalLooseFruits + element.looseFruits;
      if (!listBlockTemp.contains(element.ophBlockCode)) {
        listBlockTemp.add(element.ophBlockCode!);
        listBlockTemp.sort((a, b) => a.toString().compareTo(b.toString()));
      }
    }
    _blockList.addAll(listBlockTemp);
    _countOPH = _listOPH.length;
    notifyListeners();
  }

  onSelectedOPH(OPH oph, String method) {
    _navigationService.push(Routes.OPH_DETAIL_PAGE,
        arguments: {"oph": oph, "method": method, "restan": false});
  }

  onChangeFilterBlock(String blockValue) {
    _filterBlockValue = blockValue;
    _listOPHResult.clear();
    _countOPH = 0;
    _totalLooseFruits = 0;
    _totalBunches = 0;
    if (blockValue == "Semua") {
      for (var element in _listOPH) {
        _totalBunches = _totalBunches + element.bunchesTotal;
        _totalLooseFruits = _totalLooseFruits + element.looseFruits;
      }
      _countOPH = _listOPH.length;
      notifyListeners();
      return;
    } else {
      for (var element in _listOPH) {
        if (element.ophBlockCode!.contains(blockValue)) {
          _listOPHResult.add(element);
        }
      }
      for (var element in _listOPHResult) {
        _totalBunches = _totalBunches + element.bunchesTotal;
        _totalLooseFruits = _totalLooseFruits + element.looseFruits;
      }
      _countOPH = _listOPHResult.length;
      notifyListeners();
      return;
    }
  }
}
