// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:epms/base/common/locator.dart';
import 'package:epms/base/common/routes.dart';
import 'package:epms/common_manager/camera_service.dart';
import 'package:epms/common_manager/dialog_services.dart';
import 'package:epms/common_manager/flushbar_manager.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/common_manager/spb_card_manager.dart';
import 'package:epms/common_manager/storage_manager.dart';
import 'package:epms/common_manager/tbs_luar_card_manager.dart';
import 'package:epms/common_manager/time_manager.dart';
import 'package:epms/common_manager/value_service.dart';
import 'package:epms/database/service/database_m_config.dart';
import 'package:epms/database/service/database_m_division.dart';
import 'package:epms/database/service/database_m_employee.dart';
import 'package:epms/database/service/database_m_estate.dart';
import 'package:epms/database/service/database_m_vendor.dart';
import 'package:epms/database/service/database_spb_supervise.dart';
import 'package:epms/database/service/database_t_auth.dart';
import 'package:epms/database/service/database_tbs_luar.dart';
import 'package:epms/database/service/database_tbs_luar_one_month.dart';
import 'package:epms/model/auth_model.dart';
import 'package:epms/model/m_config_schema.dart';
import 'package:epms/model/m_division_schema.dart';
import 'package:epms/model/m_employee_schema.dart';
import 'package:epms/model/m_estate_schema.dart';
import 'package:epms/model/m_vendor_schema.dart';
import 'package:epms/model/spb.dart';
import 'package:epms/model/spb_supervise.dart';
import 'package:epms/model/supervisi_3rd_party.dart';
import 'package:epms/model/tbs_luar.dart';
import 'package:epms/widget/dialog_approval_tbs_luar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:nfc_manager/nfc_manager.dart';

class SupervisorSPBFormNotifier extends ChangeNotifier {
  final NavigatorService _navigationService = locator<NavigatorService>();

  NavigatorService get navigationService => _navigationService;

  final DialogService _dialogService = locator<DialogService>();

  DialogService get dialogService => _dialogService;

  String _supervisiID = "";

  String get supervisiID => _supervisiID;

  Position? _position;

  Position? get position => _position;

  String _date = "";

  String get date => _date;

  String _time = "";

  String get time => _time;

  String _gpsLocation = "";

  String get gpsLocation => _gpsLocation;

  MConfigSchema? _mConfigSchema;

  MConfigSchema? get mConfigSchema => _mConfigSchema;

  MEstateSchema? _mEstateSchemaValue;

  MEstateSchema? get mEstateSchemaValue => _mEstateSchemaValue;

  List<MEstateSchema> _listMEstateSchema = [];

  List<MEstateSchema> get listMEstateSchema => _listMEstateSchema;

  final List<String> _sourceSPB = ["Internal", "External"];

  List<String> get sourceSPB => _sourceSPB;

  String _sourceSPBValue = "Internal";

  String get sourceSPBValue => _sourceSPBValue;

  final List<String> _employeeType = ["Internal", "Kontrak"];

  List<String> get employeeType => _employeeType;

  String _employeeTypeValue = "Internal";

  String get employeeTypeValue => _employeeTypeValue;

  MEmployeeSchema? _driver;

  MEmployeeSchema? get driver => _driver;

  List<MEmployeeSchema> _listDriver = [];

  List<MEmployeeSchema> get listDriver => _listDriver;

  MDivisionSchema? _division;

  MDivisionSchema? get division => _division;

  List<MDivisionSchema> _listDivision = [];

  List<MDivisionSchema> get listDivision => _listDivision;

  final List<MDivisionSchema> _listDivisionResult = [];

  List<MDivisionSchema> get listDivisionResult => _listDivisionResult;

  MVendorSchema? _vendor;

  MVendorSchema? get vendor => _vendor;

  List<MVendorSchema> _listVendor = [];

  List<MVendorSchema> get listVendor => _listVendor;

  final TextEditingController _estate = TextEditingController();

  TextEditingController get estate => _estate;

  TextEditingController vehicleNumber = TextEditingController();

  final TextEditingController _janjangTangkaiPanjang = TextEditingController();

  TextEditingController get janjangTangkaiPanjang => _janjangTangkaiPanjang;

  final TextEditingController _noteJanjangTangkaiPanjang =
      TextEditingController();

  TextEditingController get noteJanjangTangkaiPanjang =>
      _noteJanjangTangkaiPanjang;

  final TextEditingController _sampah = TextEditingController();

  TextEditingController get sampah => _sampah;

  final TextEditingController _batu = TextEditingController();

  TextEditingController get batu => _batu;

  final TextEditingController _vendorOther = TextEditingController();

  TextEditingController get vendorOther => _vendorOther;

  final TextEditingController _spbID = TextEditingController();

  TextEditingController get spbID => _spbID;

  bool _activeText = false;

  bool get activeText => _activeText;

  bool _isChecked = false;

  bool get isChecked => _isChecked;

  String? _pickedFile;

  String? get pickedFile => _pickedFile;

  final List<String> _listPickedFile = [];

  List<String> get listPickedFile => _listPickedFile;

  // Masak
  final TextEditingController _masakNormal = TextEditingController();
  TextEditingController get masakNormal => _masakNormal;

  final TextEditingController _masakAbnormal = TextEditingController();
  TextEditingController get masakAbnormal => _masakAbnormal;

  final TextEditingController _masakParteno = TextEditingController();
  TextEditingController get masakParteno => _masakParteno;

  final TextEditingController _masakPatah = TextEditingController();
  TextEditingController get masakPatah => _masakPatah;

  final TextEditingController _masakDimakanTikus = TextEditingController();
  TextEditingController get masakDimakanTikus => _masakDimakanTikus;

  final TextEditingController _masakBusuk = TextEditingController();
  TextEditingController get masakBusuk => _masakBusuk;

  final TextEditingController _masakOther = TextEditingController();
  TextEditingController get masakOther => _masakOther;

  // Lewat Masak
  final TextEditingController _lewatMasakNormal = TextEditingController();
  TextEditingController get lewatMasakNormal => _lewatMasakNormal;

  final TextEditingController _lewatMasakAbnormal = TextEditingController();
  TextEditingController get lewatMasakAbnormal => _lewatMasakAbnormal;

  final TextEditingController _lewatMasakParteno = TextEditingController();
  TextEditingController get lewatMasakParteno => _lewatMasakParteno;

  final TextEditingController _lewatMasakPatah = TextEditingController();
  TextEditingController get lewatMasakPatah => _lewatMasakPatah;

  final TextEditingController _lewatMasakDimakanTikus = TextEditingController();
  TextEditingController get lewatMasakDimakanTikus => _lewatMasakDimakanTikus;

  final TextEditingController _lewatMasakBusuk = TextEditingController();
  TextEditingController get lewatMasakBusuk => _lewatMasakBusuk;

  final TextEditingController _lewatMasakOther = TextEditingController();
  TextEditingController get lewatMasakOther => _lewatMasakOther;

  // Mengkal
  final TextEditingController _mengkalNormal = TextEditingController();
  TextEditingController get mengkalNormal => _mengkalNormal;

  final TextEditingController _mengkalAbnormal = TextEditingController();
  TextEditingController get mengkalAbnormal => _mengkalAbnormal;

  final TextEditingController _mengkalParteno = TextEditingController();
  TextEditingController get mengkalParteno => _mengkalParteno;

  final TextEditingController _mengkalPatah = TextEditingController();
  TextEditingController get mengkalPatah => _mengkalPatah;

  final TextEditingController _mengkalDimakanTikus = TextEditingController();
  TextEditingController get mengkalDimakanTikus => _mengkalDimakanTikus;

  final TextEditingController _mengkalBusuk = TextEditingController();
  TextEditingController get mengkalBusuk => _mengkalBusuk;

  final TextEditingController _mengkalOther = TextEditingController();
  TextEditingController get mengkalOther => _mengkalOther;

  // Mentah
  final TextEditingController _mentahNormal = TextEditingController();
  TextEditingController get mentahNormal => _mentahNormal;

  final TextEditingController _mentahAbnormal = TextEditingController();
  TextEditingController get mentahAbnormal => _mentahAbnormal;

  final TextEditingController _mentahParteno = TextEditingController();
  TextEditingController get mentahParteno => _mentahParteno;

  final TextEditingController _mentahPatah = TextEditingController();
  TextEditingController get mentahPatah => _mentahPatah;

  final TextEditingController _mentahDimakanTikus = TextEditingController();
  TextEditingController get mentahDimakanTikus => _mentahDimakanTikus;

  final TextEditingController _mentahBusuk = TextEditingController();
  TextEditingController get mentahBusuk => _mentahBusuk;

  final TextEditingController _mentahOther = TextEditingController();
  TextEditingController get mentahOther => _mentahOther;

  // Janjang Kosong
  final TextEditingController _jangkosNormal = TextEditingController();
  TextEditingController get jangkosNormal => _jangkosNormal;

  final TextEditingController _jangkosAbnormal = TextEditingController();
  TextEditingController get jangkosAbnormal => _jangkosAbnormal;

  final TextEditingController _jangkosParteno = TextEditingController();
  TextEditingController get jangkosParteno => _jangkosParteno;

  final TextEditingController _jangkosPatah = TextEditingController();
  TextEditingController get jangkosPatah => _jangkosPatah;

  final TextEditingController _jangkosDimakanTikus = TextEditingController();
  TextEditingController get jangkosDimakanTikus => _jangkosDimakanTikus;

  final TextEditingController _jangkosBusuk = TextEditingController();
  TextEditingController get jangkosBusuk => _jangkosBusuk;

  final TextEditingController _jangkosOther = TextEditingController();
  TextEditingController get jangkosOther => _jangkosOther;

  final TextEditingController _bunchesRipe = TextEditingController();

  TextEditingController get bunchesRipe => _bunchesRipe;

  final TextEditingController _bunchesOverRipe = TextEditingController();

  TextEditingController get bunchesOverRipe => _bunchesOverRipe;

  final TextEditingController _bunchesHalfRipe = TextEditingController();

  TextEditingController get bunchesHalfRipe => _bunchesHalfRipe;

  final TextEditingController _bunchesUnRipe = TextEditingController();

  TextEditingController get bunchesUnRipe => _bunchesUnRipe;

  final TextEditingController _bunchesAbnormal = TextEditingController();

  TextEditingController get bunchesAbnormal => _bunchesAbnormal;

  final TextEditingController _bunchesEmpty = TextEditingController();

  TextEditingController get bunchesEmpty => _bunchesEmpty;

  final TextEditingController _looseFruits = TextEditingController();

  TextEditingController get looseFruits => _looseFruits;

  final TextEditingController _bunchesTotal = TextEditingController();

  TextEditingController get bunchesTotal => _bunchesTotal;

  final TextEditingController _bunchesNormalTotal = TextEditingController();

  TextEditingController get bunchesNormalTotal => _bunchesNormalTotal;

  final TextEditingController _bunchesUnNormalTotal = TextEditingController();

  TextEditingController get bunchesUnNormalTotal => _bunchesUnNormalTotal;

  final TextEditingController _notesOPH = TextEditingController();

  TextEditingController get notesOPH => _notesOPH;

  SPB? _scannedSPB;

  SPB? get scannedSPB => _scannedSPB;

  final TextEditingController _driverTBSLuar = TextEditingController();

  TextEditingController get driverTBSLuar => _driverTBSLuar;

  final TextEditingController _bunchesRotten = TextEditingController();

  TextEditingController get bunchesRotten => _bunchesRotten;

  final TextEditingController _water = TextEditingController();

  TextEditingController get water => _water;

  final TextEditingController _longStalk = TextEditingController();

  TextEditingController get longStalk => _longStalk;

  final TextEditingController _deduction = TextEditingController();

  TextEditingController get deduction => _deduction;

  final TextEditingController _bunchesLarge = TextEditingController();

  TextEditingController get bunchesLarge => _bunchesLarge;

  final TextEditingController _bunchesMedium = TextEditingController();

  TextEditingController get bunchesMedium => _bunchesMedium;

  final TextEditingController _bunchesSmall = TextEditingController();

  TextEditingController get bunchesSmall => _bunchesSmall;

  final TextEditingController _bunchesLess4Kg = TextEditingController();

  TextEditingController get bunchesLess4Kg => _bunchesLess4Kg;

  final TextEditingController _bunchesCengkeh = TextEditingController();

  TextEditingController get bunchesCengkeh => _bunchesCengkeh;

  final TextEditingController _brondolanRotten = TextEditingController();

  TextEditingController get brondolanRotten => _brondolanRotten;

  final TextEditingController _rubbish = TextEditingController();

  TextEditingController get rubbish => _rubbish;

  TBSLuar? _tbsLuar;

  TBSLuar? get tbsLuar => _tbsLuar;

  int _formType = 2;

  int get formType => _formType;

  final TextEditingController _deliveryID = TextEditingController();

  TextEditingController get deliveryID => _deliveryID;

  List<AuthModel> _authList = [];

  List<AuthModel> get authList => _authList;

  AuthModel _selectedAuth = AuthModel();

  AuthModel get selectedAuth => _selectedAuth;

  onInit() async {
    _listDriver = await DatabaseMEmployeeSchema().selectMEmployeeSchema();
    _listVendor = await DatabaseMVendorSchema().selectMVendorSchema();
    _listDivision = await DatabaseMDivisionSchema().selectMDivisionSchema();
    _listMEstateSchema = await DatabaseMEstateSchema().selectMEstateSchema();
    await getAuthList();
    generateVariable();
    getLocation();
  }

  Future<void> getAuthList() async {
    final data = await DatabaseTAuth().selectTAuth();
    _authList = data;
    _selectedAuth = _authList.first;
    print('cek auth : $_authList');

    // final pinDecode = utf8.decode(base64Decode(_selectedAuth.pin));
    // print('cek auth encode : ${_selectedAuth.pin}');
    // print('cek auth decode : $pinDecode');
    notifyListeners();
  }

  void onChangeAuth(AuthModel data) {
    _selectedAuth = data;
    notifyListeners();
  }

  getLocation() async {
    try {
      _position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .timeout(const Duration(seconds: 4));
      _gpsLocation = "${position?.latitude},${position?.longitude}";
    } on TimeoutException catch (_) {
      _gpsLocation = "";
    } catch (e) {
      _gpsLocation = "";
    }
    notifyListeners();
  }

  onChangeSourceSPB(String value) {
    _sourceSPBValue = value;
    _janjangTangkaiPanjang.text = "0";
    _noteJanjangTangkaiPanjang.clear();
    _sampah.text = "0";
    _batu.text = "0";
    _masakNormal.text = "0";
    _masakAbnormal.text = "0";
    _masakParteno.text = "0";
    _masakPatah.text = "0";
    _masakDimakanTikus.text = "0";
    _masakBusuk.text = "0";
    _masakOther.text = "0";
    _lewatMasakNormal.text = "0";
    _lewatMasakAbnormal.text = "0";
    _lewatMasakParteno.text = "0";
    _lewatMasakPatah.text = "0";
    _lewatMasakDimakanTikus.text = "0";
    _lewatMasakBusuk.text = "0";
    _lewatMasakOther.text = "0";
    _mengkalNormal.text = "0";
    _mengkalAbnormal.text = "0";
    _mengkalParteno.text = "0";
    _mengkalPatah.text = "0";
    _mengkalDimakanTikus.text = "0";
    _mengkalBusuk.text = "0";
    _mengkalOther.text = "0";
    _mentahNormal.text = "0";
    _mentahAbnormal.text = "0";
    _mentahParteno.text = "0";
    _mentahPatah.text = "0";
    _mentahDimakanTikus.text = "0";
    _mentahBusuk.text = "0";
    _mentahOther.text = "0";
    _jangkosNormal.text = "0";
    _jangkosAbnormal.text = "0";
    _jangkosParteno.text = "0";
    _jangkosPatah.text = "0";
    _jangkosDimakanTikus.text = "0";
    _jangkosBusuk.text = "0";
    _jangkosOther.text = "0";
    _bunchesRipe.text = "0";
    _bunchesOverRipe.text = "0";
    _bunchesHalfRipe.text = "0";
    _bunchesUnRipe.text = "0";
    _bunchesAbnormal.text = "0";
    _bunchesEmpty.text = "0";
    _looseFruits.text = "0";
    _bunchesTotal.text = "0";
    _bunchesNormalTotal.text = "0";
    _bunchesUnNormalTotal.text = "0";
    _notesOPH.clear();
    _bunchesRotten.text = "0";
    _water.text = "0";
    _longStalk.text = "0";
    _deduction.text = "0";
    _bunchesLarge.text = "0";
    _bunchesMedium.text = "0";
    _bunchesSmall.text = "0";
    _bunchesLess4Kg.text = "0";
    _bunchesCengkeh.text = "0";
    _brondolanRotten.text = "0";
    _rubbish.text = "0";
    notifyListeners();
  }

  onChangeTypeEmployee(String value) {
    _employeeTypeValue = value;
    notifyListeners();
  }

  onChangeEstateSchema(MEstateSchema estateSchema) {
    _mEstateSchemaValue = estateSchema;
    _listDivision.clear();
    _division = null;
    DatabaseMDivisionSchema().selectMDivisionSchema().then((value) {
      for (int i = 0; i < value.length; i++) {
        if (value[i].divisionEstateCode == estateSchema.estateCode) {
          _listDivision.add(value[i]);
        }
      }
      notifyListeners();
    });
    notifyListeners();
  }

  onChangeVendor(MVendorSchema mVendorSchema) {
    _vendor = mVendorSchema;
    notifyListeners();
  }

  dialogNFC(BuildContext context) {
    SPBCardManager().readSPBCard(context, onSuccessRead, onErrorRead);
    _dialogService.showNFCDialog(
        title: "Tempel Kartu SPB",
        subtitle: "untuk membaca data",
        buttonText: "Selesai",
        onPress: onCancelScanSPB);
  }

  onSuccessRead(BuildContext context, SPB spb) {
    checkSPBExist(spb);
    Future.delayed(const Duration(seconds: 1), () {
      NfcManager.instance.stopSession();
    });
  }

  checkSPBExist(SPB spb) async {
    List spbSupervise =
        await DatabaseSPBSupervise().selectSPBSuperviseByID(spb.spbId!);
    if (spbSupervise.isEmpty) {
      if (spb.spbType == 3) {
        _employeeTypeValue = "Kontrak";
        _vendor = _listVendor.firstWhereOrNull(
            (element) => element.vendorCode == spb.spbDriverEmployeeCode);
        if (_vendor == null) {
          _isChecked = true;
          _vendorOther.text = spb.spbDriverEmployeeCode!;
          notifyListeners();
        }
      } else {
        _employeeTypeValue = "Internal";
        _driver = _listDriver.firstWhere(
            (element) => element.employeeCode == spb.spbDriverEmployeeCode);
      }
      _scannedSPB = spb;
      _dialogService.popDialog();
      _spbID.text = spb.spbId!;
      vehicleNumber.text = spb.spbLicenseNumber!;
      _mEstateSchemaValue = _listMEstateSchema
          .where((element) => element.estateCode == spb.spbEstateCode)
          .first;
      _listDivision.clear();
      DatabaseMDivisionSchema().selectMDivisionSchema().then((value) {
        for (int i = 0; i < value.length; i++) {
          if (value[i].divisionEstateCode == spb.spbEstateCode) {
            _listDivision.add(value[i]);
          }
        }
        if (_listDivision.isNotEmpty) {
          _division = _listDivision.firstWhere(
              (element) => element.divisionCode == spb.spbDivisionCode);
        }
        notifyListeners();
      });
    } else {
      onStopNFC();
      FlushBarManager.showFlushBarWarning(
          _navigationService.navigatorKey.currentContext!,
          "Scan SPB",
          "SPB ini sudah pernah discan");
    }
    notifyListeners();
  }

  onStopNFC() {
    _dialogService.popDialog();
    Future.delayed(const Duration(seconds: 1), () {
      NfcManager.instance.stopSession();
    });
  }

  onErrorRead(BuildContext context, String response) {
    _dialogService.popDialog();
    Future.delayed(const Duration(seconds: 1), () {
      NfcManager.instance.stopSession();
    });
    FlushBarManager.showFlushBarWarning(context, "Gagal Membaca", response);
  }

  onCancelScanSPB() {
    _dialogService.popDialog();
    NfcManager.instance.stopSession();
  }

  generateVariable() async {
    _mConfigSchema = await DatabaseMConfig().selectMConfig();
    _formType = await StorageManager.readData('formType');
    DateTime now = DateTime.now();
    String millCode = await StorageManager.readData("millCode");
    NumberFormat formatterNumber = NumberFormat("000");
    String number = formatterNumber.format(mConfigSchema?.userId);
    _date = TimeManager.dateWithDash(now);
    _time = TimeManager.timeWithColon(now);
    _supervisiID =
        "$millCode${ValueService.generateIDFromDateTime(now)}${number}SM";
    _bunchesRipe.text = "0";
    _bunchesOverRipe.text = "0";
    _bunchesHalfRipe.text = "0";
    _bunchesUnRipe.text = "0";
    _bunchesAbnormal.text = "0";
    _bunchesEmpty.text = "0";
    _looseFruits.text = "0";
    _bunchesTotal.text = "0";
    _bunchesNormalTotal.text = "0";
    _janjangTangkaiPanjang.text = "0";
    _sampah.text = "0";
    _batu.text = "0";
    _bunchesUnRipe.text = "0";
    _bunchesHalfRipe.text = "0";
    _bunchesOverRipe.text = "0";
    _bunchesRotten.text = "0";
    _bunchesAbnormal.text = "0";
    _bunchesEmpty.text = "0";
    _rubbish.text = "0";
    _water.text = "0";
    _longStalk.text = "0";
    _bunchesTotal.text = "0";
    _deduction.text = "0";
    _bunchesLarge.text = "0";
    _bunchesSmall.text = "0";
    _bunchesMedium.text = "0";
    _brondolanRotten.text = "0";
    _bunchesCengkeh.text = "0";
    _bunchesLess4Kg.text = "0";
    _masakNormal.text = "0";
    _masakAbnormal.text = "0";
    _masakParteno.text = "0";
    _masakPatah.text = "0";
    _masakDimakanTikus.text = "0";
    _masakBusuk.text = "0";
    _masakOther.text = "0";
    _lewatMasakNormal.text = "0";
    _lewatMasakAbnormal.text = "0";
    _lewatMasakParteno.text = "0";
    _lewatMasakPatah.text = "0";
    _lewatMasakDimakanTikus.text = "0";
    _lewatMasakBusuk.text = "0";
    _lewatMasakOther.text = "0";
    _mengkalNormal.text = "0";
    _mengkalAbnormal.text = "0";
    _mengkalParteno.text = "0";
    _mengkalPatah.text = "0";
    _mengkalDimakanTikus.text = "0";
    _mengkalBusuk.text = "0";
    _mengkalOther.text = "0";
    _mentahNormal.text = "0";
    _mentahAbnormal.text = "0";
    _mentahParteno.text = "0";
    _mentahPatah.text = "0";
    _mentahDimakanTikus.text = "0";
    _mentahBusuk.text = "0";
    _mentahOther.text = "0";
    _jangkosNormal.text = "0";
    _jangkosAbnormal.text = "0";
    _jangkosParteno.text = "0";
    _jangkosPatah.text = "0";
    _jangkosDimakanTikus.text = "0";
    _jangkosBusuk.text = "0";
    _jangkosOther.text = "0";
    notifyListeners();
  }

  onChangeFormType(int value) {
    _formType = value;
    notifyListeners();
  }

  void removeListPickedFile(String value) {
    _listPickedFile.remove(value);
    notifyListeners();
  }

  getCamera(BuildContext context) async {
    if (sourceSPBValue == 'Internal') {
      if (listPickedFile.length < 3) {
        String? picked = await CameraService.getImageByCamera(context);
        if (picked != null) {
          _listPickedFile.add(picked);
          notifyListeners();
        }
      } else {
        FlushBarManager.showFlushBarWarning(
            _navigationService.navigatorKey.currentContext!,
            "Foto Hasil Supervisi",
            "Maksimal 3 foto yang dapat Anda lampirkan");
      }
    } else {
      String? picked = await CameraService.getImageByCamera(context);
      if (picked != null) {
        _pickedFile = picked;
        notifyListeners();
      }
    }
  }

  onSetDriver(MEmployeeSchema mEmployeeSchema) {
    if (_listDriver.contains(mEmployeeSchema)) {
      _driver = mEmployeeSchema;
      notifyListeners();
    } else {
      FlushBarManager.showFlushBarWarning(
          _navigationService.navigatorKey.currentContext!,
          "Supir Kendaraan",
          "Pekerja yang dipilih bukan supir");
    }
  }

  onChangeDivision(MDivisionSchema mDivisionSchema) {
    _division = mDivisionSchema;
    _estate.text = _division!.divisionEstateCode!;
    notifyListeners();
  }

  onChangeChecked(bool checked) {
    _isChecked = checked;
    notifyListeners();
  }

  onChangeActiveText(bool checked) {
    _activeText = checked;
    notifyListeners();
  }

  countBuahMasakAbnormal(
      BuildContext context, TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == "0") {
      textEditingController.value = const TextEditingValue(text: "0");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    } else {
      textEditingController.text =
          textEditingController.text.replaceFirst(RegExp(r'^0+'), "");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    }
    masakAbnormal.text =
        (int.parse(masakParteno.text.isNotEmpty ? masakParteno.text : "0") +
                int.parse(masakPatah.text.isNotEmpty ? masakPatah.text : "0") +
                int.parse(masakDimakanTikus.text.isNotEmpty
                    ? masakDimakanTikus.text
                    : "0") +
                int.parse(masakBusuk.text.isNotEmpty ? masakBusuk.text : "0") +
                int.parse(masakOther.text.isNotEmpty ? masakOther.text : "0"))
            .toString();
    countTotalJanjangTidakNormal();
    countTotalJanjang();
  }

  countBuahLewatMasakAbnormal(
      BuildContext context, TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == "0") {
      textEditingController.value = const TextEditingValue(text: "0");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    } else {
      textEditingController.text =
          textEditingController.text.replaceFirst(RegExp(r'^0+'), "");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    }
    lewatMasakAbnormal.text = (int.parse(lewatMasakParteno.text.isNotEmpty
                ? lewatMasakParteno.text
                : "0") +
            int.parse(
                lewatMasakPatah.text.isNotEmpty ? lewatMasakPatah.text : "0") +
            int.parse(lewatMasakDimakanTikus.text.isNotEmpty
                ? lewatMasakDimakanTikus.text
                : "0") +
            int.parse(
                lewatMasakBusuk.text.isNotEmpty ? lewatMasakBusuk.text : "0") +
            int.parse(
                lewatMasakOther.text.isNotEmpty ? lewatMasakOther.text : "0"))
        .toString();
    countTotalJanjangTidakNormal();
    countTotalJanjang();
  }

  countBuahMengkalAbnormal(
      BuildContext context, TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == "0") {
      textEditingController.value = const TextEditingValue(text: "0");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    } else {
      textEditingController.text =
          textEditingController.text.replaceFirst(RegExp(r'^0+'), "");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    }
    mengkalAbnormal.text = (int.parse(
                mengkalParteno.text.isNotEmpty ? mengkalParteno.text : "0") +
            int.parse(mengkalPatah.text.isNotEmpty ? mengkalPatah.text : "0") +
            int.parse(mengkalDimakanTikus.text.isNotEmpty
                ? mengkalDimakanTikus.text
                : "0") +
            int.parse(mengkalBusuk.text.isNotEmpty ? mengkalBusuk.text : "0") +
            int.parse(mengkalOther.text.isNotEmpty ? mengkalOther.text : "0"))
        .toString();
    countTotalJanjangTidakNormal();
    countTotalJanjang();
  }

  countBuahMentahAbnormal(
      BuildContext context, TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == "0") {
      textEditingController.value = const TextEditingValue(text: "0");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    } else {
      textEditingController.text =
          textEditingController.text.replaceFirst(RegExp(r'^0+'), "");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    }
    mentahAbnormal.text = (int.parse(
                mentahParteno.text.isNotEmpty ? mentahParteno.text : "0") +
            int.parse(mentahPatah.text.isNotEmpty ? mentahPatah.text : "0") +
            int.parse(mentahDimakanTikus.text.isNotEmpty
                ? mentahDimakanTikus.text
                : "0") +
            int.parse(mentahBusuk.text.isNotEmpty ? mentahBusuk.text : "0") +
            int.parse(mentahOther.text.isNotEmpty ? mentahOther.text : "0"))
        .toString();
    countTotalJanjangTidakNormal();
    countTotalJanjang();
  }

  countBuahJangkosAbnormal(
      BuildContext context, TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == "0") {
      textEditingController.value = const TextEditingValue(text: "0");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    } else {
      textEditingController.text =
          textEditingController.text.replaceFirst(RegExp(r'^0+'), "");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    }
    jangkosAbnormal.text = (int.parse(
                jangkosParteno.text.isNotEmpty ? jangkosParteno.text : "0") +
            int.parse(jangkosPatah.text.isNotEmpty ? jangkosPatah.text : "0") +
            int.parse(jangkosDimakanTikus.text.isNotEmpty
                ? jangkosDimakanTikus.text
                : "0") +
            int.parse(jangkosBusuk.text.isNotEmpty ? jangkosBusuk.text : "0") +
            int.parse(jangkosOther.text.isNotEmpty ? jangkosOther.text : "0"))
        .toString();
    countTotalJanjangTidakNormal();
    countTotalJanjang();
  }

  countTotalJanjangNormal(
      BuildContext context, TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == "0") {
      textEditingController.value = const TextEditingValue(text: "0");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    } else {
      textEditingController.text =
          textEditingController.text.replaceFirst(RegExp(r'^0+'), "");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    }
    bunchesNormalTotal.text = (int.parse(
                masakNormal.text.isNotEmpty ? masakNormal.text : "0") +
            int.parse(lewatMasakNormal.text.isNotEmpty
                ? lewatMasakNormal.text
                : "0") +
            int.parse(
                mengkalNormal.text.isNotEmpty ? mengkalNormal.text : "0") +
            int.parse(mentahNormal.text.isNotEmpty ? mentahNormal.text : "0") +
            int.parse(jangkosNormal.text.isNotEmpty ? jangkosNormal.text : "0"))
        .toString();
    countTotalJanjang();
    notifyListeners();
  }

  countTotalJanjangTidakNormal() {
    bunchesUnNormalTotal.text = (int.parse(
                masakAbnormal.text.isNotEmpty ? masakAbnormal.text : "0") +
            int.parse(lewatMasakAbnormal.text.isNotEmpty
                ? lewatMasakAbnormal.text
                : "0") +
            int.parse(
                mengkalAbnormal.text.isNotEmpty ? mengkalAbnormal.text : "0") +
            int.parse(
                mentahAbnormal.text.isNotEmpty ? mentahAbnormal.text : "0") +
            int.parse(
                jangkosAbnormal.text.isNotEmpty ? jangkosAbnormal.text : "0"))
        .toString();
    notifyListeners();
  }

  countTotalJanjang() {
    bunchesTotal.text = (int.parse(
                masakNormal.text.isNotEmpty ? masakNormal.text : "0") +
            int.parse(
                masakAbnormal.text.isNotEmpty ? masakAbnormal.text : "0") +
            int.parse(lewatMasakNormal.text.isNotEmpty
                ? lewatMasakNormal.text
                : "0") +
            int.parse(lewatMasakAbnormal.text.isNotEmpty
                ? lewatMasakAbnormal.text
                : "0") +
            int.parse(
                mengkalNormal.text.isNotEmpty ? mengkalNormal.text : "0") +
            int.parse(
                mengkalAbnormal.text.isNotEmpty ? mengkalAbnormal.text : "0") +
            int.parse(mentahNormal.text.isNotEmpty ? mentahNormal.text : "0") +
            int.parse(
                mentahAbnormal.text.isNotEmpty ? mentahAbnormal.text : "0") +
            int.parse(
                jangkosNormal.text.isNotEmpty ? jangkosNormal.text : "0") +
            int.parse(
                jangkosAbnormal.text.isNotEmpty ? jangkosAbnormal.text : "0"))
        .toString();
    notifyListeners();
  }

  countBunches(
      BuildContext context, TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == "0") {
      textEditingController.value = const TextEditingValue(text: "0");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    } else {
      textEditingController.text =
          textEditingController.text.replaceFirst(RegExp(r'^0+'), "");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    }
    try {
      bunchesTotal.text = (int.parse(bunchesRipe.text) +
              int.parse(bunchesOverRipe.text) +
              int.parse(bunchesHalfRipe.text) +
              int.parse(bunchesUnRipe.text) +
              int.parse(bunchesAbnormal.text) +
              int.parse(bunchesEmpty.text))
          .toString();
    } catch (e) {
      print(e);
    }
    try {
      bunchesNormalTotal.text = (int.parse(bunchesRipe.text) +
              int.parse(bunchesOverRipe.text) +
              int.parse(bunchesHalfRipe.text) +
              int.parse(bunchesUnRipe.text) +
              int.parse(bunchesEmpty.text))
          .toString();
    } catch (e) {
      print(e);
    }
  }

  void _showDialogApprovalTbsLuar(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return DialogApprovalTbsLuar(
          title: 'Approval Manager',
          labelButton: 'SUBMIT',
          hintText: 'Masukkan PIN',
          listAuthenticator: _authList,
          selectedAuthenticator: _selectedAuth,
          onChangeAuthenticator: (value) {
            onChangeAuth(value);
          },
          onSubmit: (value) {
            log('cek isAuthValid : $value');
            if (value) {
              Navigator.pop(context);
              _dialogService.showOptionDialog(
                title: "Simpan Supervisi SPB",
                subtitle: "Anda yakin ingin menyimpan Supervisi SPB?",
                buttonTextYes: "Iya",
                buttonTextNo: "Tidak",
                onPressYes: onPressYes,
                onPressNo: onPressNo,
              );
            }
          },
        );
      },
    );
  }

  showDialogQuestion(BuildContext context) {
    if (_sourceSPBValue == "Internal") {
      _dialogService.showOptionDialog(
          title: "Simpan Supervisi SPB",
          subtitle: "Anda yakin ingin menyimpan Supervisi SPB?",
          buttonTextYes: "Iya",
          buttonTextNo: "Tidak",
          onPressYes: checkFormSaveSourceSPB,
          onPressNo: onPressNo);
    } else {
      generateTBSLuar(context);
    }
  }

  onPressNo() {
    _dialogService.popDialog();
  }

  checkFormSaveSourceSPB() {
    switch (_sourceSPBValue) {
      case "Internal":
        checkFormSaveTypeEmployeeInternal();
        break;
      case "External":
        checkFormSaveTypeExternal();
        break;
    }
  }

  checkFormSaveTypeExternal() {
    if (!_isChecked) {
      if (_vendor != null) {
        if (vehicleNumber.text.isNotEmpty) {
          if (_spbID.text.isNotEmpty) {
            SPBSupervise spbSupervise = SPBSupervise();
            spbSupervise.spbSuperviseId = _supervisiID;
            spbSupervise.spbId = _spbID.text;
            spbSupervise.supervisiSpbEmployeeCode =
                _mConfigSchema?.employeeCode;
            spbSupervise.supervisiSpbEmployeeName =
                _mConfigSchema?.employeeName;
            spbSupervise.supervisiSpbLat = _position?.latitude.toString();
            spbSupervise.supervisiSpbLong = _position?.longitude.toString();
            spbSupervise.supervisiSpbDriverEmployeeCode = _vendor?.vendorCode;
            spbSupervise.supervisiSpbDriverEmployeeName =
                ValueService.rightTrimVendor(_vendor!.vendorName!);
            spbSupervise.supervisiSpbDivisionCode =
                _scannedSPB!.spbDivisionCode;
            spbSupervise.supervisiSpbLicenseNumber = vehicleNumber.text;
            spbSupervise.supervisiSpbType =
                ValueService.spbSourceData(_sourceSPBValue);
            spbSupervise.supervisiSpbMethod =
                ValueService.typeOfFormToInt(_employeeTypeValue);
            spbSupervise.supervisiSpbPhoto = _pickedFile;
            spbSupervise.bunchesRipe = int.parse(_bunchesRipe.text);
            spbSupervise.bunchesOverripe = int.parse(_bunchesOverRipe.text);
            spbSupervise.bunchesHalfripe = int.parse(_bunchesHalfRipe.text);
            spbSupervise.bunchesUnripe = int.parse(_bunchesUnRipe.text);
            spbSupervise.bunchesAbnormal = int.parse(_bunchesAbnormal.text);
            spbSupervise.bunchesEmpty = int.parse(_bunchesEmpty.text);
            spbSupervise.looseFruits = int.parse(_looseFruits.text);
            spbSupervise.bunchesTotal = int.parse(_bunchesTotal.text);
            spbSupervise.supervisiEstateCode = _mEstateSchemaValue?.estateCode;
            spbSupervise.bunchesTotalNormal =
                int.parse(_bunchesNormalTotal.text);
            spbSupervise.bunchesTangkaiPanjang =
                int.parse(_janjangTangkaiPanjang.text);
            spbSupervise.bunchesSampah = int.parse(_sampah.text);
            spbSupervise.bunchesBatu = int.parse(_batu.text);
            spbSupervise.catatanBunchesTangkaiPanjang =
                noteJanjangTangkaiPanjang.text;
            spbSupervise.supervisiNotes = _notesOPH.text;
            spbSupervise.createdBy = _mConfigSchema?.employeeName;
            spbSupervise.supervisiSpbDate = _date;
            spbSupervise.createdDate = _date;
            spbSupervise.createdTime = _time;
            saveToDatabase(spbSupervise);
          } else {
            FlushBarManager.showFlushBarWarning(
                _navigationService.navigatorKey.currentContext!,
                "SPB ID",
                "Anda belum memasukkan spb id");
          }
        } else {
          FlushBarManager.showFlushBarWarning(
              _navigationService.navigatorKey.currentContext!,
              "Nomor Kendaraan",
              "Anda belum memasukkan vendor");
        }
      } else {
        FlushBarManager.showFlushBarWarning(
            _navigationService.navigatorKey.currentContext!,
            "Vendor",
            "Anda belum memilih vendor");
      }
    } else {
      if (_vendorOther.text.isNotEmpty) {
        if (vehicleNumber.text.isNotEmpty) {
          if (_spbID.text.isNotEmpty) {
            SPBSupervise spbSupervise = SPBSupervise();
            spbSupervise.spbSuperviseId = _supervisiID;
            spbSupervise.spbId = _spbID.text;
            spbSupervise.supervisiSpbEmployeeCode =
                _mConfigSchema?.employeeCode;
            spbSupervise.supervisiSpbEmployeeName =
                _mConfigSchema?.employeeName;
            spbSupervise.supervisiEstateCode = _mEstateSchemaValue?.estateCode;
            spbSupervise.supervisiSpbLat = _position?.latitude.toString();
            spbSupervise.supervisiSpbLong = _position?.longitude.toString();
            spbSupervise.supervisiSpbDriverEmployeeCode = "";
            spbSupervise.supervisiSpbDriverEmployeeName = _vendorOther.text;
            spbSupervise.supervisiSpbDivisionCode =
                _scannedSPB!.spbDivisionCode;
            spbSupervise.supervisiSpbLicenseNumber = vehicleNumber.text;
            spbSupervise.supervisiSpbType =
                ValueService.spbSourceData(_sourceSPBValue);
            spbSupervise.supervisiSpbMethod =
                ValueService.typeOfFormToInt(_employeeTypeValue);
            spbSupervise.supervisiSpbPhoto = _pickedFile;
            spbSupervise.bunchesRipe = int.parse(_bunchesRipe.text);
            spbSupervise.bunchesOverripe = int.parse(_bunchesOverRipe.text);
            spbSupervise.bunchesHalfripe = int.parse(_bunchesHalfRipe.text);
            spbSupervise.bunchesUnripe = int.parse(_bunchesUnRipe.text);
            spbSupervise.bunchesAbnormal = int.parse(_bunchesAbnormal.text);
            spbSupervise.bunchesEmpty = int.parse(_bunchesEmpty.text);
            spbSupervise.looseFruits = int.parse(_looseFruits.text);
            spbSupervise.bunchesTotal = int.parse(_bunchesTotal.text);
            spbSupervise.bunchesTotalNormal =
                int.parse(_bunchesNormalTotal.text);
            spbSupervise.bunchesTangkaiPanjang =
                int.parse(_janjangTangkaiPanjang.text);
            spbSupervise.bunchesSampah = int.parse(_sampah.text);
            spbSupervise.bunchesBatu = int.parse(_batu.text);
            spbSupervise.catatanBunchesTangkaiPanjang =
                noteJanjangTangkaiPanjang.text;
            spbSupervise.supervisiNotes = _notesOPH.text;
            spbSupervise.createdBy = _mConfigSchema?.employeeName;
            spbSupervise.supervisiSpbDate = _date;
            spbSupervise.createdDate = _date;
            spbSupervise.createdTime = _time;
            saveToDatabase(spbSupervise);
          } else {
            FlushBarManager.showFlushBarWarning(
                _navigationService.navigatorKey.currentContext!,
                "SPB ID",
                "Anda belum memasukkan spb id");
          }
        } else {
          FlushBarManager.showFlushBarWarning(
              _navigationService.navigatorKey.currentContext!,
              "Nomor Kendaraan",
              "Anda belum memasukkan vendor");
        }
      } else {
        FlushBarManager.showFlushBarWarning(
            _navigationService.navigatorKey.currentContext!,
            "Vendor",
            "Anda belum memasukkan vendor");
      }
    }
  }

  checkFormSaveTypeEmployeeInternal() {
    switch (_employeeTypeValue) {
      case "Internal":
        if (_driver != null) {
          if (_division != null) {
            if (_mEstateSchemaValue != null) {
              if (vehicleNumber.text.isNotEmpty) {
                if (_spbID.text.isNotEmpty) {
                  if (_bunchesTotal.text != "0" || _looseFruits.text != "0") {
                    SPBSupervise spbSupervise = SPBSupervise();
                    spbSupervise.spbSuperviseId = _supervisiID;
                    spbSupervise.spbId = _spbID.text;
                    spbSupervise.supervisiSpbEmployeeCode =
                        _mConfigSchema?.employeeCode;
                    spbSupervise.supervisiSpbEmployeeName =
                        _mConfigSchema?.employeeName;
                    spbSupervise.supervisiEstateCode =
                        _mEstateSchemaValue?.estateCode;
                    spbSupervise.supervisiSpbLat =
                        _position?.latitude.toString();
                    spbSupervise.supervisiSpbLong =
                        _position?.longitude.toString();
                    spbSupervise.supervisiSpbDriverEmployeeCode =
                        _driver?.employeeCode;
                    spbSupervise.supervisiSpbDriverEmployeeName =
                        _driver?.employeeName;
                    spbSupervise.supervisiSpbDivisionCode =
                        _division?.divisionCode;
                    spbSupervise.supervisiSpbLicenseNumber = vehicleNumber.text;
                    spbSupervise.supervisiSpbType =
                        ValueService.spbSourceData(_sourceSPBValue);
                    spbSupervise.supervisiSpbMethod =
                        ValueService.typeOfFormToInt(_employeeTypeValue);
                    spbSupervise.supervisiSpbPhoto =
                        _listPickedFile.isNotEmpty ? _listPickedFile[0] : null;
                    spbSupervise.supervisiSpbPhoto1 =
                        _listPickedFile.length > 1 ? _listPickedFile[1] : null;
                    spbSupervise.supervisiSpbPhoto2 =
                        _listPickedFile.length > 2 ? _listPickedFile[2] : null;
                    spbSupervise.bunchesRipe = int.parse(
                        _masakNormal.text.isNotEmpty ? _masakNormal.text : "0");
                    spbSupervise.bunchesOverripe = int.parse(
                        _lewatMasakNormal.text.isNotEmpty
                            ? _lewatMasakNormal.text
                            : "0");
                    spbSupervise.bunchesHalfripe = int.parse(
                        _mengkalNormal.text.isNotEmpty
                            ? _mengkalNormal.text
                            : "0");
                    spbSupervise.bunchesUnripe = int.parse(
                        _mentahNormal.text.isNotEmpty
                            ? _mentahNormal.text
                            : "0");
                    spbSupervise.bunchesAbnormal = int.parse(
                        _bunchesUnNormalTotal.text.isNotEmpty
                            ? _bunchesUnNormalTotal.text
                            : "0");
                    spbSupervise.bunchesEmpty = int.parse(
                        _jangkosNormal.text.isNotEmpty
                            ? _jangkosNormal.text
                            : "0");
                    spbSupervise.looseFruits = int.parse(
                        _looseFruits.text.isNotEmpty ? _looseFruits.text : "0");
                    spbSupervise.bunchesTotal = int.parse(
                        _bunchesTotal.text.isNotEmpty
                            ? _bunchesTotal.text
                            : "0");
                    spbSupervise.bunchesTotalNormal = int.parse(
                        _bunchesNormalTotal.text.isNotEmpty
                            ? _bunchesNormalTotal.text
                            : "0");
                    spbSupervise.bunchesTangkaiPanjang = int.parse(
                        _janjangTangkaiPanjang.text.isNotEmpty
                            ? _janjangTangkaiPanjang.text
                            : "0");
                    spbSupervise.bunchesSampah =
                        int.parse(_sampah.text.isNotEmpty ? _sampah.text : "0");
                    spbSupervise.bunchesBatu =
                        int.parse(_batu.text.isNotEmpty ? _batu.text : "0");

                    spbSupervise.unripeParteno = int.parse(
                        _mentahParteno.text.isNotEmpty
                            ? _mentahParteno.text
                            : "0");
                    spbSupervise.unripeBroken = int.parse(
                        _mentahPatah.text.isNotEmpty ? _mentahPatah.text : "0");
                    spbSupervise.unripeRat = int.parse(
                        _mentahDimakanTikus.text.isNotEmpty
                            ? _mentahDimakanTikus.text
                            : "0");
                    spbSupervise.unripeRotten = int.parse(
                        _mentahBusuk.text.isNotEmpty ? _mentahBusuk.text : "0");
                    spbSupervise.unripeOther = int.parse(
                        _mentahOther.text.isNotEmpty ? _mentahOther.text : "0");
                    spbSupervise.unripeAbnormalTotal = int.parse(
                        _mentahAbnormal.text.isNotEmpty
                            ? _mentahAbnormal.text
                            : "0");

                    spbSupervise.halfripeParteno = int.parse(
                        _mengkalParteno.text.isNotEmpty
                            ? _mengkalParteno.text
                            : "0");
                    spbSupervise.halfripeBroken = int.parse(
                        _mengkalPatah.text.isNotEmpty
                            ? _mengkalPatah.text
                            : "0");
                    spbSupervise.halfripeRat = int.parse(
                        _mengkalDimakanTikus.text.isNotEmpty
                            ? _mengkalDimakanTikus.text
                            : "0");
                    spbSupervise.halfripeRotten = int.parse(
                        _mengkalBusuk.text.isNotEmpty
                            ? _mengkalBusuk.text
                            : "0");
                    spbSupervise.halfripeOther = int.parse(
                        _mengkalOther.text.isNotEmpty
                            ? _mengkalOther.text
                            : "0");
                    spbSupervise.halfripeAbnormalTotal = int.parse(
                        _mengkalAbnormal.text.isNotEmpty
                            ? _mengkalAbnormal.text
                            : "0");

                    spbSupervise.ripeParteno = int.parse(
                        _masakParteno.text.isNotEmpty
                            ? _masakParteno.text
                            : "0");
                    spbSupervise.ripeBroken = int.parse(
                        _masakPatah.text.isNotEmpty ? _masakPatah.text : "0");
                    spbSupervise.ripeRat = int.parse(
                        _masakDimakanTikus.text.isNotEmpty
                            ? _masakDimakanTikus.text
                            : "0");
                    spbSupervise.ripeRotten = int.parse(
                        _masakBusuk.text.isNotEmpty ? _masakBusuk.text : "0");
                    spbSupervise.ripeOther = int.parse(
                        _masakOther.text.isNotEmpty ? _masakOther.text : "0");
                    spbSupervise.ripeAbnormalTotal = int.parse(
                        _masakAbnormal.text.isNotEmpty
                            ? _masakAbnormal.text
                            : "0");

                    spbSupervise.overripeParteno = int.parse(
                        _lewatMasakParteno.text.isNotEmpty
                            ? _lewatMasakParteno.text
                            : "0");
                    spbSupervise.overripeBroken = int.parse(
                        _lewatMasakPatah.text.isNotEmpty
                            ? _lewatMasakPatah.text
                            : "0");
                    spbSupervise.overripeRat = int.parse(
                        _lewatMasakDimakanTikus.text.isNotEmpty
                            ? _lewatMasakDimakanTikus.text
                            : "0");
                    spbSupervise.overripeRotten = int.parse(
                        _lewatMasakBusuk.text.isNotEmpty
                            ? _lewatMasakBusuk.text
                            : "0");
                    spbSupervise.overripeOther = int.parse(
                        _lewatMasakOther.text.isNotEmpty
                            ? _lewatMasakOther.text
                            : "0");
                    spbSupervise.overripeAbnormalTotal = int.parse(
                        _lewatMasakAbnormal.text.isNotEmpty
                            ? _lewatMasakAbnormal.text
                            : "0");

                    spbSupervise.emptyParteno = int.parse(
                        _jangkosParteno.text.isNotEmpty
                            ? _jangkosParteno.text
                            : "0");
                    spbSupervise.emptyBroken = int.parse(
                        _jangkosPatah.text.isNotEmpty
                            ? _jangkosPatah.text
                            : "0");
                    spbSupervise.emptyRat = int.parse(
                        _jangkosDimakanTikus.text.isNotEmpty
                            ? _jangkosDimakanTikus.text
                            : "0");
                    spbSupervise.emptyRotten = int.parse(
                        _jangkosBusuk.text.isNotEmpty
                            ? _jangkosBusuk.text
                            : "0");
                    spbSupervise.emptyOther = int.parse(
                        _jangkosOther.text.isNotEmpty
                            ? _jangkosOther.text
                            : "0");
                    spbSupervise.emptyAbnormalTotal = int.parse(
                        _jangkosAbnormal.text.isNotEmpty
                            ? _jangkosAbnormal.text
                            : "0");

                    spbSupervise.catatanBunchesTangkaiPanjang =
                        noteJanjangTangkaiPanjang.text;
                    spbSupervise.supervisiNotes = _notesOPH.text;
                    spbSupervise.createdBy = _mConfigSchema?.employeeName;
                    spbSupervise.supervisiSpbDate = _date;
                    spbSupervise.createdDate = _date;
                    spbSupervise.createdTime = _time;
                    saveToDatabase(spbSupervise);
                  } else {
                    FlushBarManager.showFlushBarWarning(
                        _navigationService.navigatorKey.currentContext!,
                        "Grading",
                        "Anda belum mengisi grading");
                  }
                } else {
                  FlushBarManager.showFlushBarWarning(
                      _navigationService.navigatorKey.currentContext!,
                      "SPB ID",
                      "Anda belum mengisi SPB ID");
                }
              } else {
                FlushBarManager.showFlushBarWarning(
                    _navigationService.navigatorKey.currentContext!,
                    "Nomor Kendaraan",
                    "Anda belum mengisi nomor kendaraan");
              }
            } else {
              FlushBarManager.showFlushBarWarning(
                  _navigationService.navigatorKey.currentContext!,
                  "Estate",
                  "Anda belum mengisi estate");
            }
          } else {
            FlushBarManager.showFlushBarWarning(
                _navigationService.navigatorKey.currentContext!,
                "Divisi",
                "Anda belum memilih divisi");
          }
        } else {
          FlushBarManager.showFlushBarWarning(
              _navigationService.navigatorKey.currentContext!,
              "Nama Supir",
              "Anda belum memilih supir");
        }
        break;
      case "Kontrak":
        if (!_isChecked) {
          if (_vendor != null) {
            if (_division != null) {
              if (_mEstateSchemaValue != null) {
                if (vehicleNumber.text.isNotEmpty) {
                  if (_spbID.text.isNotEmpty) {
                    SPBSupervise spbSupervise = SPBSupervise();
                    spbSupervise.spbSuperviseId = _supervisiID;
                    spbSupervise.spbId = _spbID.text;
                    spbSupervise.supervisiSpbEmployeeCode =
                        _mConfigSchema?.employeeCode;
                    spbSupervise.supervisiSpbEmployeeName =
                        _mConfigSchema?.employeeName;
                    spbSupervise.supervisiEstateCode =
                        _mEstateSchemaValue?.estateCode;
                    spbSupervise.supervisiSpbLat =
                        _position?.latitude.toString();
                    spbSupervise.supervisiSpbLong =
                        _position?.longitude.toString();
                    spbSupervise.supervisiSpbDriverEmployeeCode =
                        _vendor?.vendorCode;
                    spbSupervise.supervisiSpbDriverEmployeeName =
                        ValueService.rightTrimVendor(_vendor!.vendorName!);
                    spbSupervise.supervisiSpbDivisionCode =
                        _division?.divisionCode;
                    spbSupervise.supervisiSpbLicenseNumber = vehicleNumber.text;
                    spbSupervise.supervisiSpbType =
                        ValueService.spbSourceData(_sourceSPBValue);
                    spbSupervise.supervisiSpbMethod =
                        ValueService.typeOfFormToInt(_employeeTypeValue);
                    spbSupervise.supervisiSpbPhoto =
                        _listPickedFile.isNotEmpty ? _listPickedFile[0] : null;
                    spbSupervise.supervisiSpbPhoto1 =
                        _listPickedFile.length > 1 ? _listPickedFile[1] : null;
                    spbSupervise.supervisiSpbPhoto2 =
                        _listPickedFile.length > 2 ? _listPickedFile[2] : null;
                    spbSupervise.bunchesRipe = int.parse(
                        _masakNormal.text.isNotEmpty ? _masakNormal.text : "0");
                    spbSupervise.bunchesOverripe = int.parse(
                        _lewatMasakNormal.text.isNotEmpty
                            ? _lewatMasakNormal.text
                            : "0");
                    spbSupervise.bunchesHalfripe = int.parse(
                        _mengkalNormal.text.isNotEmpty
                            ? _mengkalNormal.text
                            : "0");
                    spbSupervise.bunchesUnripe = int.parse(
                        _mentahNormal.text.isNotEmpty
                            ? _mentahNormal.text
                            : "0");
                    spbSupervise.bunchesAbnormal = int.parse(
                        _bunchesUnNormalTotal.text.isNotEmpty
                            ? _bunchesUnNormalTotal.text
                            : "0");
                    spbSupervise.bunchesEmpty = int.parse(
                        _jangkosNormal.text.isNotEmpty
                            ? _jangkosNormal.text
                            : "0");
                    spbSupervise.looseFruits = int.parse(
                        _looseFruits.text.isNotEmpty ? _looseFruits.text : "0");
                    spbSupervise.bunchesTotal = int.parse(
                        _bunchesTotal.text.isNotEmpty
                            ? _bunchesTotal.text
                            : "0");
                    spbSupervise.bunchesTotalNormal = int.parse(
                        _bunchesNormalTotal.text.isNotEmpty
                            ? _bunchesNormalTotal.text
                            : "0");
                    spbSupervise.bunchesTangkaiPanjang = int.parse(
                        _janjangTangkaiPanjang.text.isNotEmpty
                            ? _janjangTangkaiPanjang.text
                            : "0");
                    spbSupervise.bunchesSampah =
                        int.parse(_sampah.text.isNotEmpty ? _sampah.text : "0");
                    spbSupervise.bunchesBatu =
                        int.parse(_batu.text.isNotEmpty ? _batu.text : "0");

                    spbSupervise.unripeParteno = int.parse(
                        _mentahParteno.text.isNotEmpty
                            ? _mentahParteno.text
                            : "0");
                    spbSupervise.unripeBroken = int.parse(
                        _mentahPatah.text.isNotEmpty ? _mentahPatah.text : "0");
                    spbSupervise.unripeRat = int.parse(
                        _mentahDimakanTikus.text.isNotEmpty
                            ? _mentahDimakanTikus.text
                            : "0");
                    spbSupervise.unripeRotten = int.parse(
                        _mentahBusuk.text.isNotEmpty ? _mentahBusuk.text : "0");
                    spbSupervise.unripeOther = int.parse(
                        _mentahOther.text.isNotEmpty ? _mentahOther.text : "0");
                    spbSupervise.unripeAbnormalTotal = int.parse(
                        _mentahAbnormal.text.isNotEmpty
                            ? _mentahAbnormal.text
                            : "0");

                    spbSupervise.halfripeParteno = int.parse(
                        _mengkalParteno.text.isNotEmpty
                            ? _mengkalParteno.text
                            : "0");
                    spbSupervise.halfripeBroken = int.parse(
                        _mengkalPatah.text.isNotEmpty
                            ? _mengkalPatah.text
                            : "0");
                    spbSupervise.halfripeRat = int.parse(
                        _mengkalDimakanTikus.text.isNotEmpty
                            ? _mengkalDimakanTikus.text
                            : "0");
                    spbSupervise.halfripeRotten = int.parse(
                        _mengkalBusuk.text.isNotEmpty
                            ? _mengkalBusuk.text
                            : "0");
                    spbSupervise.halfripeOther = int.parse(
                        _mengkalOther.text.isNotEmpty
                            ? _mengkalOther.text
                            : "0");
                    spbSupervise.halfripeAbnormalTotal = int.parse(
                        _mengkalAbnormal.text.isNotEmpty
                            ? _mengkalAbnormal.text
                            : "0");

                    spbSupervise.ripeParteno = int.parse(
                        _masakParteno.text.isNotEmpty
                            ? _masakParteno.text
                            : "0");
                    spbSupervise.ripeBroken = int.parse(
                        _masakPatah.text.isNotEmpty ? _masakPatah.text : "0");
                    spbSupervise.ripeRat = int.parse(
                        _masakDimakanTikus.text.isNotEmpty
                            ? _masakDimakanTikus.text
                            : "0");
                    spbSupervise.ripeRotten = int.parse(
                        _masakBusuk.text.isNotEmpty ? _masakBusuk.text : "0");
                    spbSupervise.ripeOther = int.parse(
                        _masakOther.text.isNotEmpty ? _masakOther.text : "0");
                    spbSupervise.ripeAbnormalTotal = int.parse(
                        _masakAbnormal.text.isNotEmpty
                            ? _masakAbnormal.text
                            : "0");

                    spbSupervise.overripeParteno = int.parse(
                        _lewatMasakParteno.text.isNotEmpty
                            ? _lewatMasakParteno.text
                            : "0");
                    spbSupervise.overripeBroken = int.parse(
                        _lewatMasakPatah.text.isNotEmpty
                            ? _lewatMasakPatah.text
                            : "0");
                    spbSupervise.overripeRat = int.parse(
                        _lewatMasakDimakanTikus.text.isNotEmpty
                            ? _lewatMasakDimakanTikus.text
                            : "0");
                    spbSupervise.overripeRotten = int.parse(
                        _lewatMasakBusuk.text.isNotEmpty
                            ? _lewatMasakBusuk.text
                            : "0");
                    spbSupervise.overripeOther = int.parse(
                        _lewatMasakOther.text.isNotEmpty
                            ? _lewatMasakOther.text
                            : "0");
                    spbSupervise.overripeAbnormalTotal = int.parse(
                        _lewatMasakAbnormal.text.isNotEmpty
                            ? _lewatMasakAbnormal.text
                            : "0");

                    spbSupervise.emptyParteno = int.parse(
                        _jangkosParteno.text.isNotEmpty
                            ? _jangkosParteno.text
                            : "0");
                    spbSupervise.emptyBroken = int.parse(
                        _jangkosPatah.text.isNotEmpty
                            ? _jangkosPatah.text
                            : "0");
                    spbSupervise.emptyRat = int.parse(
                        _jangkosDimakanTikus.text.isNotEmpty
                            ? _jangkosDimakanTikus.text
                            : "0");
                    spbSupervise.emptyRotten = int.parse(
                        _jangkosBusuk.text.isNotEmpty
                            ? _jangkosBusuk.text
                            : "0");
                    spbSupervise.emptyOther = int.parse(
                        _jangkosOther.text.isNotEmpty
                            ? _jangkosOther.text
                            : "0");
                    spbSupervise.emptyAbnormalTotal = int.parse(
                        _jangkosAbnormal.text.isNotEmpty
                            ? _jangkosAbnormal.text
                            : "0");

                    spbSupervise.catatanBunchesTangkaiPanjang =
                        noteJanjangTangkaiPanjang.text;
                    spbSupervise.supervisiNotes = _notesOPH.text;
                    spbSupervise.createdBy = _mConfigSchema?.employeeName;
                    spbSupervise.supervisiSpbDate = _date;
                    spbSupervise.createdDate = _date;
                    spbSupervise.createdTime = _time;
                    saveToDatabase(spbSupervise);
                  } else {
                    FlushBarManager.showFlushBarWarning(
                        _navigationService.navigatorKey.currentContext!,
                        "SPB ID",
                        "Anda belum mengisi nomor SPB");
                  }
                } else {
                  FlushBarManager.showFlushBarWarning(
                      _navigationService.navigatorKey.currentContext!,
                      "Nomor Kendaraan",
                      "Anda belum mengisi nomor kendaraan");
                }
              } else {
                FlushBarManager.showFlushBarWarning(
                    _navigationService.navigatorKey.currentContext!,
                    "Estate",
                    "Anda belum memasukkan estate");
              }
            } else {
              FlushBarManager.showFlushBarWarning(
                  _navigationService.navigatorKey.currentContext!,
                  "Divisi",
                  "Anda belum memilih divisi");
            }
          } else {
            FlushBarManager.showFlushBarWarning(
                _navigationService.navigatorKey.currentContext!,
                "Vendor",
                "Anda belum memilih vendor");
          }
        } else {
          if (_vendorOther.text.isNotEmpty) {
            if (_division != null) {
              if (_mEstateSchemaValue != null) {
                if (vehicleNumber.text.isNotEmpty) {
                  if (_spbID.text.isNotEmpty) {
                    SPBSupervise spbSupervise = SPBSupervise();
                    spbSupervise.spbSuperviseId = _supervisiID;
                    spbSupervise.spbId = _spbID.text;
                    spbSupervise.supervisiSpbEmployeeCode =
                        _mConfigSchema?.employeeCode;
                    spbSupervise.supervisiSpbEmployeeName =
                        _mConfigSchema?.employeeName;
                    spbSupervise.supervisiEstateCode =
                        _mEstateSchemaValue?.estateCode;
                    spbSupervise.supervisiSpbLat =
                        _position?.latitude.toString();
                    spbSupervise.supervisiSpbLong =
                        _position?.longitude.toString();
                    spbSupervise.supervisiSpbDriverEmployeeCode =
                        _vendorOther.text;
                    spbSupervise.supervisiSpbDriverEmployeeName =
                        _vendorOther.text;
                    spbSupervise.supervisiSpbDivisionCode =
                        _division?.divisionCode;
                    spbSupervise.supervisiSpbLicenseNumber = vehicleNumber.text;
                    spbSupervise.supervisiSpbType =
                        ValueService.spbSourceData(_sourceSPBValue);
                    spbSupervise.supervisiSpbMethod =
                        ValueService.typeOfFormToInt(_employeeTypeValue);
                    spbSupervise.supervisiSpbPhoto =
                        _listPickedFile.isNotEmpty ? _listPickedFile[0] : null;
                    spbSupervise.supervisiSpbPhoto1 =
                        _listPickedFile.length > 1 ? _listPickedFile[1] : null;
                    spbSupervise.supervisiSpbPhoto2 =
                        _listPickedFile.length > 2 ? _listPickedFile[2] : null;
                    spbSupervise.bunchesRipe = int.parse(
                        _masakNormal.text.isNotEmpty ? _masakNormal.text : "0");
                    spbSupervise.bunchesOverripe = int.parse(
                        _lewatMasakNormal.text.isNotEmpty
                            ? _lewatMasakNormal.text
                            : "0");
                    spbSupervise.bunchesHalfripe = int.parse(
                        _mengkalNormal.text.isNotEmpty
                            ? _mengkalNormal.text
                            : "0");
                    spbSupervise.bunchesUnripe = int.parse(
                        _mentahNormal.text.isNotEmpty
                            ? _mentahNormal.text
                            : "0");
                    spbSupervise.bunchesAbnormal = int.parse(
                        _bunchesUnNormalTotal.text.isNotEmpty
                            ? _bunchesUnNormalTotal.text
                            : "0");
                    spbSupervise.bunchesEmpty = int.parse(
                        _jangkosNormal.text.isNotEmpty
                            ? _jangkosNormal.text
                            : "0");
                    spbSupervise.looseFruits = int.parse(
                        _looseFruits.text.isNotEmpty ? _looseFruits.text : "0");
                    spbSupervise.bunchesTotal = int.parse(
                        _bunchesTotal.text.isNotEmpty
                            ? _bunchesTotal.text
                            : "0");
                    spbSupervise.bunchesTotalNormal = int.parse(
                        _bunchesNormalTotal.text.isNotEmpty
                            ? _bunchesNormalTotal.text
                            : "0");
                    spbSupervise.bunchesTangkaiPanjang = int.parse(
                        _janjangTangkaiPanjang.text.isNotEmpty
                            ? _janjangTangkaiPanjang.text
                            : "0");
                    spbSupervise.bunchesSampah =
                        int.parse(_sampah.text.isNotEmpty ? _sampah.text : "0");
                    spbSupervise.bunchesBatu =
                        int.parse(_batu.text.isNotEmpty ? _batu.text : "0");

                    spbSupervise.unripeParteno = int.parse(
                        _mentahParteno.text.isNotEmpty
                            ? _mentahParteno.text
                            : "0");
                    spbSupervise.unripeBroken = int.parse(
                        _mentahPatah.text.isNotEmpty ? _mentahPatah.text : "0");
                    spbSupervise.unripeRat = int.parse(
                        _mentahDimakanTikus.text.isNotEmpty
                            ? _mentahDimakanTikus.text
                            : "0");
                    spbSupervise.unripeRotten = int.parse(
                        _mentahBusuk.text.isNotEmpty ? _mentahBusuk.text : "0");
                    spbSupervise.unripeOther = int.parse(
                        _mentahOther.text.isNotEmpty ? _mentahOther.text : "0");
                    spbSupervise.unripeAbnormalTotal = int.parse(
                        _mentahAbnormal.text.isNotEmpty
                            ? _mentahAbnormal.text
                            : "0");

                    spbSupervise.halfripeParteno = int.parse(
                        _mengkalParteno.text.isNotEmpty
                            ? _mengkalParteno.text
                            : "0");
                    spbSupervise.halfripeBroken = int.parse(
                        _mengkalPatah.text.isNotEmpty
                            ? _mengkalPatah.text
                            : "0");
                    spbSupervise.halfripeRat = int.parse(
                        _mengkalDimakanTikus.text.isNotEmpty
                            ? _mengkalDimakanTikus.text
                            : "0");
                    spbSupervise.halfripeRotten = int.parse(
                        _mengkalBusuk.text.isNotEmpty
                            ? _mengkalBusuk.text
                            : "0");
                    spbSupervise.halfripeOther = int.parse(
                        _mengkalOther.text.isNotEmpty
                            ? _mengkalOther.text
                            : "0");
                    spbSupervise.halfripeAbnormalTotal = int.parse(
                        _mengkalAbnormal.text.isNotEmpty
                            ? _mengkalAbnormal.text
                            : "0");

                    spbSupervise.ripeParteno = int.parse(
                        _masakParteno.text.isNotEmpty
                            ? _masakParteno.text
                            : "0");
                    spbSupervise.ripeBroken = int.parse(
                        _masakPatah.text.isNotEmpty ? _masakPatah.text : "0");
                    spbSupervise.ripeRat = int.parse(
                        _masakDimakanTikus.text.isNotEmpty
                            ? _masakDimakanTikus.text
                            : "0");
                    spbSupervise.ripeRotten = int.parse(
                        _masakBusuk.text.isNotEmpty ? _masakBusuk.text : "0");
                    spbSupervise.ripeOther = int.parse(
                        _masakOther.text.isNotEmpty ? _masakOther.text : "0");
                    spbSupervise.ripeAbnormalTotal = int.parse(
                        _masakAbnormal.text.isNotEmpty
                            ? _masakAbnormal.text
                            : "0");

                    spbSupervise.overripeParteno = int.parse(
                        _lewatMasakParteno.text.isNotEmpty
                            ? _lewatMasakParteno.text
                            : "0");
                    spbSupervise.overripeBroken = int.parse(
                        _lewatMasakPatah.text.isNotEmpty
                            ? _lewatMasakPatah.text
                            : "0");
                    spbSupervise.overripeRat = int.parse(
                        _lewatMasakDimakanTikus.text.isNotEmpty
                            ? _lewatMasakDimakanTikus.text
                            : "0");
                    spbSupervise.overripeRotten = int.parse(
                        _lewatMasakBusuk.text.isNotEmpty
                            ? _lewatMasakBusuk.text
                            : "0");
                    spbSupervise.overripeOther = int.parse(
                        _lewatMasakOther.text.isNotEmpty
                            ? _lewatMasakOther.text
                            : "0");
                    spbSupervise.overripeAbnormalTotal = int.parse(
                        _lewatMasakAbnormal.text.isNotEmpty
                            ? _lewatMasakAbnormal.text
                            : "0");

                    spbSupervise.emptyParteno = int.parse(
                        _jangkosParteno.text.isNotEmpty
                            ? _jangkosParteno.text
                            : "0");
                    spbSupervise.emptyBroken = int.parse(
                        _jangkosPatah.text.isNotEmpty
                            ? _jangkosPatah.text
                            : "0");
                    spbSupervise.emptyRat = int.parse(
                        _jangkosDimakanTikus.text.isNotEmpty
                            ? _jangkosDimakanTikus.text
                            : "0");
                    spbSupervise.emptyRotten = int.parse(
                        _jangkosBusuk.text.isNotEmpty
                            ? _jangkosBusuk.text
                            : "0");
                    spbSupervise.emptyOther = int.parse(
                        _jangkosOther.text.isNotEmpty
                            ? _jangkosOther.text
                            : "0");
                    spbSupervise.emptyAbnormalTotal = int.parse(
                        _jangkosAbnormal.text.isNotEmpty
                            ? _jangkosAbnormal.text
                            : "0");

                    spbSupervise.catatanBunchesTangkaiPanjang =
                        noteJanjangTangkaiPanjang.text;
                    spbSupervise.supervisiNotes = _notesOPH.text;
                    spbSupervise.createdBy = _mConfigSchema?.employeeName;
                    spbSupervise.supervisiSpbDate = _date;
                    spbSupervise.createdDate = _date;
                    spbSupervise.createdTime = _time;
                    saveToDatabase(spbSupervise);
                  } else {
                    FlushBarManager.showFlushBarWarning(
                        _navigationService.navigatorKey.currentContext!,
                        "SPB ID",
                        "Anda belum mengisi nomor SPB");
                  }
                } else {
                  FlushBarManager.showFlushBarWarning(
                      _navigationService.navigatorKey.currentContext!,
                      "Nomor Kendaraan",
                      "Anda belum mengisi nomor kendaraan");
                }
              } else {
                FlushBarManager.showFlushBarWarning(
                    _navigationService.navigatorKey.currentContext!,
                    "Estate",
                    "Anda belum memasukkan estate");
              }
            } else {
              FlushBarManager.showFlushBarWarning(
                  _navigationService.navigatorKey.currentContext!,
                  "Divisi",
                  "Anda belum memilih divisi");
            }
          } else {
            FlushBarManager.showFlushBarWarning(
                _navigationService.navigatorKey.currentContext!,
                "Vendor",
                "Anda belum memasukkan nama vendor");
          }
        }
        break;
    }
  }

  saveToDatabase(SPBSupervise spbSupervise) async {
    _dialogService.popDialog();
    int count = await DatabaseSPBSupervise().insertSPBSupervise(spbSupervise);
    if (count > 0) {
      _navigationService.push(Routes.HOME_PAGE);
      FlushBarManager.showFlushBarSuccess(
          _navigationService.navigatorKey.currentContext!,
          "Supervisi SPB",
          "Berhasil tersimpan");
    } else {
      FlushBarManager.showFlushBarError(
          _navigationService.navigatorKey.currentContext!,
          "Supervisi SPB",
          "Gagal tersimpan");
    }
  }

  countBunchesTBSLuar(
      BuildContext context, TextEditingController textEditingController) {
    if (textEditingController.text.isEmpty ||
        textEditingController.text == "0" ||
        textEditingController.text == "00") {
      textEditingController.value = const TextEditingValue(text: "0");
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
      String deductionText = (double.parse(_bunchesUnRipe.text) +
              double.parse(_bunchesHalfRipe.text) +
              double.parse(_bunchesOverRipe.text) +
              double.parse(_bunchesRotten.text) +
              double.parse(_brondolanRotten.text) +
              double.parse(_bunchesAbnormal.text) +
              double.parse(_bunchesEmpty.text) +
              double.parse(_rubbish.text) +
              double.parse(_water.text) +
              double.parse(_longStalk.text) +
              double.parse(_bunchesCengkeh.text) +
              double.parse(_bunchesLess4Kg.text))
          .toString();
      if (deductionText == "0.0") {
        _deduction.text = "0";
      } else {
        _deduction.text = deductionText;
      }
    } else {
      if (textEditingController != _bunchesTotal) {
        if (double.parse(textEditingController.text) > 1) {
          textEditingController.text =
              textEditingController.text.replaceFirst(RegExp(r'^0+'), "");
        }
      } else {
        textEditingController.text =
            textEditingController.text.replaceFirst(RegExp(r'^0+'), "");
      }
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
      String deductionText = (double.parse(_bunchesUnRipe.text) +
              double.parse(_bunchesHalfRipe.text) +
              double.parse(_bunchesOverRipe.text) +
              double.parse(_bunchesRotten.text) +
              double.parse(_brondolanRotten.text) +
              double.parse(_bunchesAbnormal.text) +
              double.parse(_bunchesEmpty.text) +
              double.parse(_rubbish.text) +
              double.parse(_water.text) +
              double.parse(_longStalk.text) +
              double.parse(_bunchesCengkeh.text) +
              double.parse(_bunchesLess4Kg.text))
          .toString();
      if (deductionText == "0.0") {
        _deduction.text = "0";
      } else {
        _deduction.text = deductionText;
      }
      notifyListeners();
    }
  }

  showDialogQuestionTBSLuar(BuildContext context) {
    generateTBSLuar(context);
  }

  generateTBSLuar(BuildContext context) {
    if (_vendor != null) {
      if (driverTBSLuar.text.isNotEmpty) {
        if (vehicleNumber.text.isNotEmpty) {
          if (_spbID.text.isNotEmpty) {
            if (_pickedFile != null) {
              if ((_bunchesTotal.text != "0" && _bunchesSmall.text == "0") ||
                  (_bunchesTotal.text == "0" && _bunchesSmall.text != "0")) {
                _tbsLuar = TBSLuar();
                _tbsLuar?.formType = _formType;
                _tbsLuar?.spdID = _spbID.text;
                _tbsLuar?.supplierCode = _vendor?.vendorCode;
                _tbsLuar?.supplierName = _vendor?.vendorName;
                _tbsLuar?.supervisiName = _mConfigSchema?.employeeName;
                _tbsLuar?.createdDate = _date;
                _tbsLuar?.createdTime = _time;
                _tbsLuar?.createdBy = _mConfigSchema?.employeeCode;
                _tbsLuar?.gpsLat = _position?.latitude;
                _tbsLuar?.gpsLong = _position?.longitude;
                _tbsLuar?.driverName = _driverTBSLuar.text;
                _tbsLuar?.licenseNumber = vehicleNumber.text;
                _tbsLuar?.sortasiID = _supervisiID;
                _tbsLuar?.bunchesUnripe = double.parse(_bunchesUnRipe.text);
                _tbsLuar?.bunchesUnripe = double.parse(_bunchesUnRipe.text);
                _tbsLuar?.bunchesHalfripe = double.parse(_bunchesHalfRipe.text);
                _tbsLuar?.bunchesOverripe = double.parse(_bunchesOverRipe.text);
                _tbsLuar?.bunchesRotten = double.parse(_bunchesRotten.text);
                _tbsLuar?.bunchesAbnormal = double.parse(_bunchesAbnormal.text);
                _tbsLuar?.bunchesEmpty = double.parse(_bunchesEmpty.text);
                _tbsLuar?.rubbish = double.parse(_rubbish.text);
                _tbsLuar?.water = double.parse(_water.text);
                _tbsLuar?.bunchesTotal = double.parse(_bunchesTotal.text);
                _tbsLuar?.deduction = double.parse(_deduction.text);
                _tbsLuar?.small = double.parse(_bunchesSmall.text);
                _tbsLuar?.medium = double.parse(_bunchesMedium.text);
                _tbsLuar?.large = double.parse(_bunchesLarge.text);
                _tbsLuar?.longStalk = double.parse(_longStalk.text);
                _tbsLuar?.bunchesCengkeh = double.parse(_bunchesCengkeh.text);
                _tbsLuar?.brondolanRotten = double.parse(_brondolanRotten.text);
                _tbsLuar?.bunchesLess4Kg = double.parse(_bunchesLess4Kg.text);
                _tbsLuar?.gradingPhoto = _pickedFile;
                _tbsLuar?.notes = _notesOPH.text;
                notifyListeners();
                _showDialogApprovalTbsLuar(context);
              } else {
                FlushBarManager.showFlushBarWarning(
                    context,
                    "Sortasi atau Grading",
                    "Komidal dan Total janjang hanya diisi salah satu");
              }
            } else {
              FlushBarManager.showFlushBarWarning(
                  context, "Foto Grading", "Anda belum mengambil foto grading");
            }
          } else {
            FlushBarManager.showFlushBarWarning(context, "Delivery Order ID",
                "Anda belum scan QR Delivery Order");
          }
        } else {
          FlushBarManager.showFlushBarWarning(
              context, "Nomor Kendaraan", "Nomor Kendaraan belum terisi");
        }
      } else {
        FlushBarManager.showFlushBarWarning(
            context, "Nama Supir", "Nama Supier belum terisi");
      }
    } else {
      FlushBarManager.showFlushBarWarning(
          context, "Supplier", "Nama Supplier belum terpilih");
    }
  }

  onPressYes() {
    _dialogService.popDialog();
    TBSLuarCardManager().writeTBSLuarCard(
        _navigationService.navigatorKey.currentContext!,
        _tbsLuar!,
        onSuccessWrite,
        onErrorWrite);
    _dialogService.showNFCDialog(
        title: "Tempel Kartu NFC",
        subtitle: "Untuk memasukkan data",
        buttonText: "Batal",
        onPress: onPressBatal);
  }

  onSuccessWrite(BuildContext context, TBSLuar tbsLuar) {
    saveToDatabaseTBSLuar(tbsLuar);
  }

  onErrorWrite(BuildContext context) {
    FlushBarManager.showFlushBarWarning(
        context, "Supplier", "Nama Supplier belum terpilih");
  }

  onPressBatal() {
    NfcManager.instance.stopSession();
    _dialogService.popDialog();
  }

  onPressNoTBSLuar() {
    _dialogService.popDialog();
  }

  saveToDatabaseTBSLuar(TBSLuar tbsLuar) async {
    _dialogService.popDialog();
    int count = await DatabaseTBSLuar().insertTBSLuar(tbsLuar);
    if (count > 0) {
      _navigationService.push(Routes.HOME_PAGE);
      FlushBarManager.showFlushBarSuccess(
          _navigationService.navigatorKey.currentContext!,
          "Supervisi SPB",
          "Berhasil tersimpan");
    } else {
      FlushBarManager.showFlushBarError(
          _navigationService.navigatorKey.currentContext!,
          "Supervisi SPB",
          "Gagal tersimpan");
    }
  }

  setQRResult(String result) async {
    var tag = result.split(',');
    TBSLuar? tbsLuar = await DatabaseTBSLuar().selectTBSLuarByID(tag[0]);
    Supervisi3rdParty? supervisi3rdParty =
        await DatabaseTBSLuarOneMonth().selectTBSLuarOneMonthByID(tag[0]);
    if (tbsLuar == null && supervisi3rdParty == null) {
      int totalBunches = 0;
      _spbID.text = tag[0];
      for (var element in _listVendor) {
        if (tag[1] == element.vendorCode) {
          _vendor = element;
          notifyListeners();
        }
      }
      _driverTBSLuar.text = tag[2];
      vehicleNumber.text = tag[3].split('[').first;
      String farmer = result.split('[').last.split(']').first;
      farmer.split('#').forEach((element) {
        int total = int.parse(element.split(',')[1]);
        totalBunches = totalBunches + total;
      }); // brow
    } else {
      FlushBarManager.showFlushBarWarning(
          _navigationService.navigatorKey.currentContext!,
          "QR DO",
          "Sudah pernah scan Grading");
    }
  }

  checkDONumber(String idDO) async {
    TBSLuar? tbsLuar = await DatabaseTBSLuar().selectTBSLuarByID(idDO);
    if (tbsLuar != null) {
      FlushBarManager.showFlushBarWarning(
          _navigationService.navigatorKey.currentContext!,
          "QR DO",
          "Sudah pernah scan Grading");
    }
  }
}
