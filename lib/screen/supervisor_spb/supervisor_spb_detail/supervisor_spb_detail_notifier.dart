// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:epms/base/common/locator.dart';
import 'package:epms/base/common/routes.dart';
import 'package:epms/common_manager/camera_service.dart';
import 'package:epms/common_manager/dialog_services.dart';
import 'package:epms/common_manager/flushbar_manager.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/common_manager/spb_card_manager.dart';
import 'package:epms/common_manager/time_manager.dart';
import 'package:epms/database/service/database_m_config.dart';
import 'package:epms/database/service/database_spb_supervise.dart';
import 'package:epms/model/m_config_schema.dart';
import 'package:epms/model/spb.dart';
import 'package:epms/model/spb_supervise.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class SupervisorSPBDetailNotifier extends ChangeNotifier {
  final NavigatorService _navigationService = locator<NavigatorService>();

  NavigatorService get navigationService => _navigationService;

  final DialogService _dialogService = locator<DialogService>();

  DialogService get dialogService => _dialogService;

  final TextEditingController _spbID = TextEditingController();

  TextEditingController get spbID => _spbID;

  bool _activeText = false;

  bool get activeText => _activeText;

  SPBSupervise _spbSupervise = SPBSupervise();

  SPBSupervise get spbSupervise => _spbSupervise;

  MConfigSchema _mConfigSchema = MConfigSchema();

  MConfigSchema get mConfigSchema => _mConfigSchema;

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

  // final TextEditingController _bunchesRipe = TextEditingController();

  // TextEditingController get bunchesRipe => _bunchesRipe;

  // final TextEditingController _bunchesOverRipe = TextEditingController();

  // TextEditingController get bunchesOverRipe => _bunchesOverRipe;

  // final TextEditingController _bunchesHalfRipe = TextEditingController();

  // TextEditingController get bunchesHalfRipe => _bunchesHalfRipe;

  // final TextEditingController _bunchesUnRipe = TextEditingController();

  // TextEditingController get bunchesUnRipe => _bunchesUnRipe;

  // final TextEditingController _bunchesAbnormal = TextEditingController();

  // TextEditingController get bunchesAbnormal => _bunchesAbnormal;

  // final TextEditingController _bunchesEmpty = TextEditingController();

  // TextEditingController get bunchesEmpty => _bunchesEmpty;

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

  bool _onEdit = false;

  bool get onEdit => _onEdit;

  dialogNFC(BuildContext context) {
    SPBCardManager().readSPBCard(context, onSuccessRead, onErrorRead);
    _dialogService.showNFCDialog(
        title: "Tempel Kartu SPB",
        subtitle: "untuk membaca data",
        buttonText: "Selesai",
        onPress: onCancelScanSPB);
  }

  onCancelScanSPB() {
    _dialogService.popDialog();
    NfcManager.instance.stopSession();
  }

  onSuccessRead(BuildContext context, SPB spb) {
    _dialogService.popDialog();
    _spbID.text = spb.spbId!;
    Future.delayed(const Duration(seconds: 1), () {
      NfcManager.instance.stopSession();
    });
    notifyListeners();
  }

  onErrorRead(BuildContext context, String response) {
    _dialogService.popDialog();
    Future.delayed(const Duration(seconds: 1), () {
      NfcManager.instance.stopSession();
    });
    FlushBarManager.showFlushBarWarning(context, "Gagal Membaca", response);
  }

  onChangeActiveText(bool checked) {
    _activeText = checked;
    notifyListeners();
  }

  onInit(SPBSupervise spbSupervise) async {
    _mConfigSchema = await DatabaseMConfig().selectMConfig();
    _spbSupervise = spbSupervise;

    if (spbSupervise.supervisiSpbPhoto != null) {
      _listPickedFile.add(spbSupervise.supervisiSpbPhoto!);
    }
    if (spbSupervise.supervisiSpbPhoto1 != null) {
      _listPickedFile.add(spbSupervise.supervisiSpbPhoto1!);
    }
    if (spbSupervise.supervisiSpbPhoto2 != null) {
      _listPickedFile.add(spbSupervise.supervisiSpbPhoto2!);
    }

    _masakNormal.text = spbSupervise.bunchesRipe.toString();
    _lewatMasakNormal.text = spbSupervise.bunchesOverripe.toString();
    _mengkalNormal.text = spbSupervise.bunchesHalfripe.toString();
    _mentahNormal.text = spbSupervise.bunchesUnripe.toString();
    _jangkosNormal.text = spbSupervise.bunchesEmpty.toString();
    _bunchesUnNormalTotal.text = spbSupervise.bunchesAbnormal.toString();
    _bunchesNormalTotal.text = spbSupervise.bunchesTotalNormal.toString();
    _janjangTangkaiPanjang.text = spbSupervise.bunchesTangkaiPanjang.toString();

    _mentahParteno.text = spbSupervise.unripeParteno.toString();
    _mentahPatah.text = spbSupervise.unripeBroken.toString();
    _mentahDimakanTikus.text = spbSupervise.unripeRat.toString();
    _mentahBusuk.text = spbSupervise.unripeRotten.toString();
    _mentahOther.text = spbSupervise.unripeOther.toString();
    _mentahAbnormal.text = spbSupervise.unripeAbnormalTotal.toString();

    _mengkalParteno.text = spbSupervise.halfripeParteno.toString();
    _mengkalPatah.text = spbSupervise.halfripeBroken.toString();
    _mengkalDimakanTikus.text = spbSupervise.halfripeRat.toString();
    _mengkalBusuk.text = spbSupervise.halfripeRotten.toString();
    _mengkalOther.text = spbSupervise.halfripeOther.toString();
    _mengkalAbnormal.text = spbSupervise.halfripeAbnormalTotal.toString();

    _masakParteno.text = spbSupervise.ripeParteno.toString();
    _masakPatah.text = spbSupervise.ripeBroken.toString();
    _masakDimakanTikus.text = spbSupervise.ripeRat.toString();
    _masakBusuk.text = spbSupervise.ripeRotten.toString();
    _masakOther.text = spbSupervise.ripeOther.toString();
    _masakAbnormal.text = spbSupervise.ripeAbnormalTotal.toString();

    _lewatMasakParteno.text = spbSupervise.overripeParteno.toString();
    _lewatMasakPatah.text = spbSupervise.overripeBroken.toString();
    _lewatMasakDimakanTikus.text = spbSupervise.overripeRat.toString();
    _lewatMasakBusuk.text = spbSupervise.overripeRotten.toString();
    _lewatMasakOther.text = spbSupervise.overripeOther.toString();
    _lewatMasakAbnormal.text = spbSupervise.overripeAbnormalTotal.toString();

    _jangkosParteno.text = spbSupervise.emptyParteno.toString();
    _jangkosPatah.text = spbSupervise.emptyBroken.toString();
    _jangkosDimakanTikus.text = spbSupervise.emptyRat.toString();
    _jangkosBusuk.text = spbSupervise.emptyRotten.toString();
    _jangkosOther.text = spbSupervise.emptyOther.toString();
    _jangkosAbnormal.text = spbSupervise.emptyAbnormalTotal.toString();

    // _bunchesRipe.text = spbSupervise.bunchesRipe.toString();
    // _bunchesOverRipe.text = spbSupervise.bunchesOverripe.toString();
    // _bunchesHalfRipe.text = spbSupervise.bunchesHalfripe.toString();
    // _bunchesUnRipe.text = spbSupervise.bunchesUnripe.toString();
    // _bunchesAbnormal.text = spbSupervise.bunchesAbnormal.toString();
    // _bunchesEmpty.text = spbSupervise.bunchesEmpty.toString();
    _looseFruits.text = spbSupervise.looseFruits.toString();
    _bunchesTotal.text = spbSupervise.bunchesTotal.toString();
    // _bunchesNormalTotal.text = spbSupervise.bunchesTotalNormal.toString();
    // _janjangTangkaiPanjang.text = spbSupervise.bunchesTangkaiPanjang.toString();
    _sampah.text = spbSupervise.bunchesSampah.toString();
    _batu.text = spbSupervise.bunchesBatu.toString();
    _spbID.text = spbSupervise.spbId!;
    _noteJanjangTangkaiPanjang.text =
        spbSupervise.catatanBunchesTangkaiPanjang.toString();
    _notesOPH.text = spbSupervise.supervisiNotes.toString();
    notifyListeners();
  }

  onPressYes() {
    _dialogService.popDialog();
    if (_bunchesTotal.text != "0" || _looseFruits.text != "0") {
      updateToDatabase(_navigationService.navigatorKey.currentContext!);
    } else {
      FlushBarManager.showFlushBarWarning(
          _navigationService.navigatorKey.currentContext!,
          "Grading",
          "Anda belum mengisi grading");
    }
  }

  onPressNo() {
    _dialogService.popDialog();
    NfcManager.instance.stopSession();
  }

  showDialogQuestion(BuildContext context) {
    _dialogService.showOptionDialog(
        title: "Simpan Supervisi",
        subtitle: "Anda yakin ingin menyimpan supervisi?",
        buttonTextYes: "Iya",
        buttonTextNo: "Tidak",
        onPressYes: onPressYes,
        onPressNo: onPressNo);
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
      // bunchesTotal.text = (int.parse(bunchesRipe.text) +
      //         int.parse(bunchesOverRipe.text) +
      //         int.parse(bunchesHalfRipe.text) +
      //         int.parse(bunchesUnRipe.text) +
      //         int.parse(bunchesAbnormal.text) +
      //         int.parse(bunchesEmpty.text))
      //     .toString();
    } catch (e) {
      print(e);
    }
    try {
      // bunchesNormalTotal.text = (int.parse(bunchesRipe.text) +
      //         int.parse(bunchesOverRipe.text) +
      //         int.parse(bunchesHalfRipe.text) +
      //         int.parse(bunchesUnRipe.text) +
      //         int.parse(bunchesEmpty.text))
      //     .toString();
    } catch (e) {
      print(e);
    }
  }

  onChangeEdit() {
    _onEdit = true;
    notifyListeners();
  }

  void removeListPickedFile(String value) {
    _listPickedFile.remove(value);
    notifyListeners();
  }

  getCamera(BuildContext context) async {
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
  }

  void updateToDatabase(BuildContext context) async {
    DateTime now = DateTime.now();
    spbSupervise.supervisiSpbPhoto =
        _listPickedFile.isNotEmpty ? _listPickedFile[0] : null;
    spbSupervise.supervisiSpbPhoto1 =
        _listPickedFile.length > 1 ? _listPickedFile[1] : null;
    spbSupervise.supervisiSpbPhoto2 =
        _listPickedFile.length > 2 ? _listPickedFile[2] : null;

    _spbSupervise.bunchesRipe =
        int.parse(_masakNormal.text.isNotEmpty ? _masakNormal.text : "0");
    _spbSupervise.bunchesOverripe = int.parse(
        _lewatMasakNormal.text.isNotEmpty ? _lewatMasakNormal.text : "0");
    _spbSupervise.bunchesHalfripe =
        int.parse(_mengkalNormal.text.isNotEmpty ? _mengkalNormal.text : "0");
    _spbSupervise.bunchesUnripe =
        int.parse(_mentahNormal.text.isNotEmpty ? _mentahNormal.text : "0");
    _spbSupervise.bunchesAbnormal = int.parse(
        _bunchesUnNormalTotal.text.isNotEmpty
            ? _bunchesUnNormalTotal.text
            : "0");
    _spbSupervise.bunchesEmpty =
        int.parse(_jangkosNormal.text.isNotEmpty ? _jangkosNormal.text : "0");
    _spbSupervise.looseFruits =
        int.parse(_looseFruits.text.isNotEmpty ? _looseFruits.text : "0");
    _spbSupervise.bunchesTotal =
        int.parse(_bunchesTotal.text.isNotEmpty ? _bunchesTotal.text : "0");
    _spbSupervise.bunchesTotalNormal = int.parse(
        _bunchesNormalTotal.text.isNotEmpty ? _bunchesNormalTotal.text : "0");
    _spbSupervise.bunchesSampah =
        int.parse(_sampah.text.isNotEmpty ? _sampah.text : "0");
    _spbSupervise.bunchesBatu =
        int.parse(_batu.text.isNotEmpty ? _batu.text : "0");
    _spbSupervise.bunchesTangkaiPanjang = int.parse(
        _janjangTangkaiPanjang.text.isNotEmpty
            ? _janjangTangkaiPanjang.text
            : "0");
    _spbSupervise.catatanBunchesTangkaiPanjang = noteJanjangTangkaiPanjang.text;

    spbSupervise.unripeParteno =
        int.parse(_mentahParteno.text.isNotEmpty ? _mentahParteno.text : "0");
    spbSupervise.unripeBroken =
        int.parse(_mentahPatah.text.isNotEmpty ? _mentahPatah.text : "0");
    spbSupervise.unripeRat = int.parse(
        _mentahDimakanTikus.text.isNotEmpty ? _mentahDimakanTikus.text : "0");
    spbSupervise.unripeRotten =
        int.parse(_mentahBusuk.text.isNotEmpty ? _mentahBusuk.text : "0");
    spbSupervise.unripeOther =
        int.parse(_mentahOther.text.isNotEmpty ? _mentahOther.text : "0");
    spbSupervise.unripeAbnormalTotal =
        int.parse(_mentahAbnormal.text.isNotEmpty ? _mentahAbnormal.text : "0");

    spbSupervise.halfripeParteno =
        int.parse(_mengkalParteno.text.isNotEmpty ? _mengkalParteno.text : "0");
    spbSupervise.halfripeBroken =
        int.parse(_mengkalPatah.text.isNotEmpty ? _mengkalPatah.text : "0");
    spbSupervise.halfripeRat = int.parse(
        _mengkalDimakanTikus.text.isNotEmpty ? _mengkalDimakanTikus.text : "0");
    spbSupervise.halfripeRotten =
        int.parse(_mengkalBusuk.text.isNotEmpty ? _mengkalBusuk.text : "0");
    spbSupervise.halfripeOther =
        int.parse(_mengkalOther.text.isNotEmpty ? _mengkalOther.text : "0");
    spbSupervise.halfripeAbnormalTotal = int.parse(
        _mengkalAbnormal.text.isNotEmpty ? _mengkalAbnormal.text : "0");

    spbSupervise.ripeParteno =
        int.parse(_masakParteno.text.isNotEmpty ? _masakParteno.text : "0");
    spbSupervise.ripeBroken =
        int.parse(_masakPatah.text.isNotEmpty ? _masakPatah.text : "0");
    spbSupervise.ripeRat = int.parse(
        _masakDimakanTikus.text.isNotEmpty ? _masakDimakanTikus.text : "0");
    spbSupervise.ripeRotten =
        int.parse(_masakBusuk.text.isNotEmpty ? _masakBusuk.text : "0");
    spbSupervise.ripeOther =
        int.parse(_masakOther.text.isNotEmpty ? _masakOther.text : "0");
    spbSupervise.ripeAbnormalTotal =
        int.parse(_masakAbnormal.text.isNotEmpty ? _masakAbnormal.text : "0");

    spbSupervise.overripeParteno = int.parse(
        _lewatMasakParteno.text.isNotEmpty ? _lewatMasakParteno.text : "0");
    spbSupervise.overripeBroken = int.parse(
        _lewatMasakPatah.text.isNotEmpty ? _lewatMasakPatah.text : "0");
    spbSupervise.overripeRat = int.parse(_lewatMasakDimakanTikus.text.isNotEmpty
        ? _lewatMasakDimakanTikus.text
        : "0");
    spbSupervise.overripeRotten = int.parse(
        _lewatMasakBusuk.text.isNotEmpty ? _lewatMasakBusuk.text : "0");
    spbSupervise.overripeOther = int.parse(
        _lewatMasakOther.text.isNotEmpty ? _lewatMasakOther.text : "0");
    spbSupervise.overripeAbnormalTotal = int.parse(
        _lewatMasakAbnormal.text.isNotEmpty ? _lewatMasakAbnormal.text : "0");

    spbSupervise.emptyParteno =
        int.parse(_jangkosParteno.text.isNotEmpty ? _jangkosParteno.text : "0");
    spbSupervise.emptyBroken =
        int.parse(_jangkosPatah.text.isNotEmpty ? _jangkosPatah.text : "0");
    spbSupervise.emptyRat = int.parse(
        _jangkosDimakanTikus.text.isNotEmpty ? _jangkosDimakanTikus.text : "0");
    spbSupervise.emptyRotten =
        int.parse(_jangkosBusuk.text.isNotEmpty ? _jangkosBusuk.text : "0");
    spbSupervise.emptyOther =
        int.parse(_jangkosOther.text.isNotEmpty ? _jangkosOther.text : "0");
    spbSupervise.emptyAbnormalTotal = int.parse(
        _jangkosAbnormal.text.isNotEmpty ? _jangkosAbnormal.text : "0");

    _spbSupervise.spbId = _spbID.text;
    _spbSupervise.supervisiNotes = _notesOPH.text;
    _spbSupervise.updatedBy = _mConfigSchema.employeeName;
    _spbSupervise.updatedDate = TimeManager.dateWithDash(now);
    _spbSupervise.updatedTime = TimeManager.timeWithColon(now);
    int count =
        await DatabaseSPBSupervise().updateSPBSuperviseByID(spbSupervise);
    if (count > 0) {
      _navigationService.push(Routes.HOME_PAGE);
      FlushBarManager.showFlushBarSuccess(
          context, "Simpan Supervisi", "Berhasil menyimpan Supervisi");
    } else {
      FlushBarManager.showFlushBarError(
          context, "Simpan Supervisi", "Gagal menyimpan Supervisi");
    }
  }
}
