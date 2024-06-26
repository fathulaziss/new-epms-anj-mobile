// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:epms/base/common/locator.dart';
import 'package:epms/base/common/routes.dart';
import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/base/ui/theme_notifier.dart';
import 'package:epms/common_manager/camera_service.dart';
import 'package:epms/common_manager/dialog_services.dart';
import 'package:epms/common_manager/flushbar_manager.dart';
import 'package:epms/common_manager/inspection_service.dart';
import 'package:epms/common_manager/location_service.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/common_manager/storage_manager.dart';
import 'package:epms/common_manager/time_manager.dart';
import 'package:epms/common_manager/value_service.dart';
import 'package:epms/database/helper/convert_helper.dart';
import 'package:epms/database/service/database_action_inspection.dart';
import 'package:epms/database/service/database_attachment_inspection.dart';
import 'package:epms/database/service/database_response_inspection.dart';
import 'package:epms/database/service/database_subordinate_inspection.dart';
import 'package:epms/database/service/database_ticket_inspection.dart';
import 'package:epms/database/service/database_todo_inspection.dart';
import 'package:epms/database/service/database_user_inspection_config.dart';
import 'package:epms/model/attachment_inspection_model.dart';
import 'package:epms/model/response_inspection_model.dart';
import 'package:epms/model/ticket_inspection_model.dart';
import 'package:epms/model/user_inspection_config_model.dart';
import 'package:epms/model/user_inspection_model.dart';
import 'package:epms/screen/inspection/components/card_history_inspection.dart';
import 'package:epms/screen/inspection/components/input_primary.dart';
import 'package:epms/screen/inspection/components/inspection_photo.dart';
import 'package:epms/screen/inspection/inspection_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InspectionAssignmentDetailView extends StatefulWidget {
  const InspectionAssignmentDetailView({super.key, required this.data});

  final TicketInspectionModel data;

  @override
  State<InspectionAssignmentDetailView> createState() =>
      _InspectionAssignmentDetailViewState();
}

class _InspectionAssignmentDetailViewState
    extends State<InspectionAssignmentDetailView> {
  final NavigatorService _navigationService = locator<NavigatorService>();
  final DialogService _dialogService = locator<DialogService>();

  String responseId = '';
  UserInspectionConfigModel user = const UserInspectionConfigModel();

  double longitude = 0;
  double latitude = 0;
  String gpsLocation = '';

  final descriptionController = TextEditingController();
  final actionController = TextEditingController();

  // List<HistoryInspectionModel> listHistoryInspection = [];

  UserInspectionModel? selectedUserInspection;

  List<String> listActionOption = const [];
  String? selectedAction;

  final listInspectionPhoto = [];

  bool isPreviewPhoto = false;

  bool isShowDialogAttachment = false;

  bool isShowDialogSubmit = false;

  List<ResponseInspectionModel> listResponseInspection = [];
  Map<String, List<AttachmentInspectionModel>> listResponseAttachment = {};
  List<AttachmentInspectionModel> listInspectionAttachment = [];

  bool isLoading = false;

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    isLoading = true;
    // await initAttachment();
    await getInspectionAttachment();
    await getResponseInspection();
    descriptionController.text = widget.data.description;
    // listHistoryInspection = widget.data.responses;
    getResponseId();
    getOptionAction();
    getUser();
    getLocation();
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    setState(() {});
  }

  Future<void> getInspectionAttachment() async {
    final listInspectionAttachmentData =
        await DatabaseAttachmentInspection.selectDataByCode(widget.data.code);
    listInspectionAttachment = listInspectionAttachmentData;
    setState(() {});
  }

  Future<void> getResponseInspection() async {
    final listResponseInspectionData =
        await DatabaseResponseInspection.selectDataByInspectionId(
      widget.data.id,
    );

    listResponseInspection = listResponseInspectionData;

    await Future.forEach(listResponseInspectionData, (response) async {
      final listResponseAttachmentData =
          await DatabaseAttachmentInspection.selectDataByCode(response.code);
      listResponseAttachment[response.code] = listResponseAttachmentData;
    });

    setState(() {});
  }

  // Future<void> initAttachment() async {
  //   for (final attachment in widget.data.attachments) {
  //     final indexAttachment = widget.data.attachments.indexOf(attachment);
  //     final code = '${widget.data.code}$indexAttachment';

  //     final inspectionAttachment =
  //         await DatabaseAttachmentInspection.selectData(code);
  //     listInspectionAttachment.add(inspectionAttachment);
  //   }

  //   for (final response in widget.data.responses) {
  //     final listResponseAttachmentTemp = <AttachmentInspectionModel>[];

  //     for (final attachment in response.attachments) {
  //       final indexAttachment = response.attachments.indexOf(attachment);
  //       final code = '${response.code}$indexAttachment';

  //       final inspectionAttachment =
  //           await DatabaseAttachmentInspection.selectData(code);
  //       listResponseAttachmentTemp.add(inspectionAttachment);
  //     }

  //     listResponseAttachment[response.code] = listResponseAttachmentTemp;
  //   }

  //   setState(() {});
  // }

  bool validateForm() {
    if (selectedAction == null) {
      FlushBarManager.showFlushBarWarning(
        context,
        "Form Belum Lengkap",
        "Mohon memilih action terlebih dahulu",
      );
      return false;
    }

    if (selectedAction != null && selectedAction == 'reassign') {
      if (selectedUserInspection == null) {
        FlushBarManager.showFlushBarWarning(
          context,
          "Form Belum Lengkap",
          "Mohon memilih user reassign terlebih dahulu",
        );
        return false;
      }

      if (actionController.text.isEmpty) {
        FlushBarManager.showFlushBarWarning(
          context,
          "Form Belum Lengkap",
          "Mohon mengisi deskripsi tindakan terlebih dahulu",
        );
        return false;
      }
    }

    if (selectedAction != null && selectedAction != 'reassign') {
      if (actionController.text.isEmpty) {
        FlushBarManager.showFlushBarWarning(
          context,
          "Form Belum Lengkap",
          "Mohon mengisi deskripsi tindakan terlebih dahulu",
        );
        return false;
      }

      if (listInspectionPhoto.isEmpty) {
        FlushBarManager.showFlushBarWarning(
          context,
          "Form Belum Lengkap",
          "Mohon melampirkan bukti foto",
        );
        return false;
      }
    }

    return true;
  }

  Future<void> getUser() async {
    final data = await DatabaseUserInspectionConfig.selectData();
    user = data;
    log('cek user : $user');
    setState(() {});
  }

  Future<void> getLocation() async {
    while (gpsLocation.isEmpty) {
      final position = await LocationService.getGPSLocation();
      if (position != null) {
        longitude = position.longitude;
        latitude = position.latitude;
        gpsLocation = "${position.longitude}, ${position.latitude}";
      }
    }
    log('cek inspection location : $gpsLocation');
    setState(() {});
  }

  Future<void> getOptionAction() async {
    final data =
        await DatabaseActionInspection.selectDataByStatus(widget.data.status);
    listActionOption = List<String>.from(data.options.map((e) => e.toString()));
    log('cek list action options : $listActionOption');
    setState(() {});
  }

  Future<void> getResponseId() async {
    final responses = await DatabaseResponseInspection.selectDataByInspectionId(
        widget.data.id);
    final dateNow = DateTime.now();
    final dateNowConvert = ValueService.generateIDFromDateTime(dateNow);
    math.Random random = math.Random();
    var randomNumber = random.nextInt(100);
    responseId = 'R${responses.length + 1}$dateNowConvert$randomNumber';
    setState(() {});
  }

  Future<void> createResponse(
    BuildContext context, {
    required TicketInspectionModel toDoInspection,
    required ResponseInspectionModel responseInspection,
  }) async {
    _dialogService.showLoadingDialog(title: "Upload Data");
    await InspectionRepository().createResponseInspection(
      context,
      responseInspection,
      (context, successMessage) async {
        await DatabaseTodoInspection.deleteTodoByCode(toDoInspection);
        await DatabaseResponseInspection.deleteResponseByCode(
            responseInspection.code);
        // await DatabaseAttachmentInspection.deleteDataByCode(
        //     responseInspection.code);

        await getDataInspection(context);
      },
      (context, errorMessage) async {
        _dialogService.popDialog();
        FlushBarManager.showFlushBarError(
          context,
          "Gagal Upload",
          errorMessage,
        );
      },
    );
  }

  Future<void> getDataInspection(BuildContext context) async {
    await InspectionRepository().getMyInspectionClose(
      context,
      (context, data) async {
        await DatabaseResponseInspection.addAllData(data.responses);
        await DatabaseTicketInspection.addAllDataNew(data.inspection);
        await DatabaseSubordinateInspection.addAllDataNew(data.inspection);
        await DatabaseAttachmentInspection.addAllData(data);

        await InspectionRepository().getMyInspectionNotClose(
          context,
          (context, data) async {
            await DatabaseResponseInspection.addAllData(data.responses);
            await DatabaseTicketInspection.addAllDataNew(data.inspection);
            await DatabaseSubordinateInspection.addAllDataNew(data.inspection);
            await DatabaseAttachmentInspection.addAllData(data);

            await InspectionRepository().getToDoInspection(
              context,
              (context, data) async {
                await DatabaseResponseInspection.addAllData(data.responses);
                await DatabaseTodoInspection.addAllDataNew(data.inspection);
                await DatabaseAttachmentInspection.addAllData(data);

                await InspectionRepository().getOnGoingInspectionClose(
                  context,
                  (context, data) async {
                    await DatabaseResponseInspection.addAllData(data.responses);
                    await DatabaseSubordinateInspection.addAllDataNew(
                        data.inspection);
                    await DatabaseAttachmentInspection.addAllData(data);

                    await InspectionRepository().getOnGoingInspectionNotClose(
                      context,
                      (context, data) async {
                        await DatabaseResponseInspection.addAllData(
                            data.responses);
                        await DatabaseSubordinateInspection.addAllDataNew(
                            data.inspection);
                        await DatabaseAttachmentInspection.addAllData(data);

                        await InspectionRepository().getToDoInspectionClose(
                          context,
                          (context, data) async {
                            await DatabaseResponseInspection.addAllData(
                                data.responses);
                            await DatabaseSubordinateInspection.addAllDataNew(
                                data.inspection);
                            await DatabaseAttachmentInspection.addAllData(data);

                            await InspectionRepository()
                                .getToDoInspectionNotClose(
                              context,
                              (context, data) async {
                                await DatabaseResponseInspection.addAllData(
                                    data.responses);
                                await DatabaseSubordinateInspection
                                    .addAllDataNew(data.inspection);
                                await DatabaseAttachmentInspection.addAllData(
                                    data);

                                final now = DateTime.now();
                                await StorageManager.saveData(
                                    "lastSynchTimeInspection",
                                    TimeManager.timeWithColon(now));
                                await StorageManager.saveData(
                                    "lastSynchDateInspection",
                                    TimeManager.dateWithDash(now));

                                _dialogService.popDialog();
                                _navigationService.pop();
                                FlushBarManager.showFlushBarSuccess(
                                  context,
                                  "Berhasil Upload",
                                  'Data Berhasil Di Upload',
                                );
                              },
                              (context, errorMessage) {
                                FlushBarManager.showFlushBarError(
                                    context, "Gagal Upload", errorMessage);
                                _dialogService.popDialog();
                              },
                            );
                          },
                          (context, errorMessage) {
                            FlushBarManager.showFlushBarError(
                                context, "Gagal Upload", errorMessage);
                            _dialogService.popDialog();
                          },
                        );
                      },
                      (context, errorMessage) {
                        FlushBarManager.showFlushBarError(
                            context, "Gagal Upload", errorMessage);
                        _dialogService.popDialog();
                      },
                    );
                  },
                  (context, errorMessage) {
                    FlushBarManager.showFlushBarError(
                        context, "Gagal Upload", errorMessage);
                    _dialogService.popDialog();
                  },
                );
              },
              (context, errorMessage) {
                FlushBarManager.showFlushBarError(
                    context, "Gagal Upload", errorMessage);
                _dialogService.popDialog();
              },
            );
          },
          (context, errorMessage) {
            FlushBarManager.showFlushBarError(
                context, "Gagal Upload", errorMessage);
            _dialogService.popDialog();
          },
        );
      },
      (context, errorMessage) {
        FlushBarManager.showFlushBarError(
            context, "Gagal Upload", errorMessage);
        _dialogService.popDialog();
      },
    );

    // await InspectionRepository().getMyInspection(
    //   context,
    //   (context, data) async {
    //     await DatabaseTicketInspection.addAllData(data);
    //     await DatabaseAttachmentInspection.addAllDataNew(data);
    //     await InspectionRepository().getToDoInspection(
    //       context,
    //       (context, data) async {
    //         await DatabaseTodoInspection.addAllData(data);
    //         await DatabaseAttachmentInspection.addAllDataNew(data);
    //         await InspectionRepository().getMySubordinate(
    //           context,
    //           (context, data) async {
    //             await DatabaseSubordinateInspection.addAllData(data);
    //             await DatabaseAttachmentInspection.addAllDataNew(data);
    //             _dialogService.popDialog();
    //             _navigationService.pop();
    //             FlushBarManager.showFlushBarSuccess(
    //               context,
    //               "Berhasil Upload",
    //               'Data Berhasil Di Upload',
    //             );
    //           },
    //           (context, errorMessage) {
    //             _dialogService.popDialog();
    //             FlushBarManager.showFlushBarError(
    //               context,
    //               "Gagal Upload",
    //               errorMessage,
    //             );
    //           },
    //         );
    //       },
    //       (context, errorMessage) async {
    //         await InspectionRepository().getMySubordinate(
    //           context,
    //           (context, data) async {
    //             await DatabaseSubordinateInspection.addAllData(data);
    //             await DatabaseAttachmentInspection.addAllDataNew(data);
    //             _dialogService.popDialog();
    //             _navigationService.pop();
    //             FlushBarManager.showFlushBarSuccess(
    //               context,
    //               "Berhasil Upload",
    //               'Data Berhasil Di Upload',
    //             );
    //           },
    //           (context, errorMessage) {
    //             _dialogService.popDialog();
    //             FlushBarManager.showFlushBarError(
    //               context,
    //               "Gagal Upload",
    //               errorMessage,
    //             );
    //           },
    //         );
    //       },
    //     );
    //   },
    //   (context, errorMessage) async {
    //     await InspectionRepository().getToDoInspection(
    //       context,
    //       (context, data) async {
    //         await DatabaseTodoInspection.addAllData(data);
    //         await DatabaseAttachmentInspection.addAllDataNew(data);
    //         await InspectionRepository().getMySubordinate(
    //           context,
    //           (context, data) async {
    //             await DatabaseSubordinateInspection.addAllData(data);
    //             await DatabaseAttachmentInspection.addAllDataNew(data);
    //             _dialogService.popDialog();
    //             _navigationService.pop();
    //             FlushBarManager.showFlushBarSuccess(
    //               context,
    //               "Berhasil Upload",
    //               'Data Berhasil Di Upload',
    //             );
    //           },
    //           (context, errorMessage) {
    //             _dialogService.popDialog();
    //             FlushBarManager.showFlushBarError(
    //               context,
    //               "Gagal Upload",
    //               errorMessage,
    //             );
    //           },
    //         );
    //       },
    //       (context, errorMessage) async {
    //         await InspectionRepository().getMySubordinate(
    //           context,
    //           (context, data) async {
    //             await DatabaseSubordinateInspection.addAllData(data);
    //             await DatabaseAttachmentInspection.addAllDataNew(data);
    //             _dialogService.popDialog();
    //             _navigationService.pop();
    //             FlushBarManager.showFlushBarSuccess(
    //               context,
    //               "Berhasil Upload",
    //               'Data Berhasil Di Upload',
    //             );
    //           },
    //           (context, errorMessage) {
    //             _dialogService.popDialog();
    //             FlushBarManager.showFlushBarError(
    //               context,
    //               "Gagal Upload",
    //               errorMessage,
    //             );
    //           },
    //         );
    //       },
    //     );
    //   },
    // );
  }

  void showSubmitOption() {
    FocusManager.instance.primaryFocus?.unfocus();
    _dialogService.showDialogSubmitInspection(
      title: 'Submit Inspection',
      desc: 'Apakah data yang Anda masukkan sudah benar ?',
      labelConfirm: 'YA',
      labelCancel: 'TIDAK',
      onTapConfirm: () async {
        setState(() {
          isShowDialogSubmit = false;
        });
        _dialogService.popDialog();
        await submit();
      },
      onTapCancel: () {
        setState(() {
          isShowDialogSubmit = false;
        });
        _dialogService.popDialog();
      },
    );
  }

  Future<void> submit() async {
    if (validateForm()) {
      final dataResponse = ResponseInspectionModel(
        tInspectionId: widget.data.id,
        code: responseId,
        trTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        submittedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        submittedBy: user.id,
        submittedByName: user.name,
        description: actionController.text,
        reassignedTo:
            selectedUserInspection != null ? selectedUserInspection!.id : '',
        reassignedToName:
            selectedUserInspection != null ? selectedUserInspection!.name : '',
        gpsLat: latitude,
        gpsLng: longitude,
        status: selectedAction ?? '',
        attachments: listInspectionPhoto,
        isNewResponse: 0,
        isSynchronize: 0,
      );

      listResponseInspection.add(dataResponse);

      final dataInspection = TicketInspectionModel(
        id: widget.data.id,
        code: widget.data.code,
        trTime: widget.data.trTime,
        mCompanyId: widget.data.mCompanyId,
        mCompanyName: widget.data.mCompanyName,
        mCompanyAlias: widget.data.mCompanyAlias,
        mTeamId: widget.data.mTeamId,
        mTeamName: widget.data.mTeamName,
        mDivisionId: widget.data.mDivisionId,
        mDivisionName: widget.data.mDivisionName,
        mDivisionEstateCode: widget.data.mDivisionEstateCode,
        gpsLng: widget.data.gpsLng,
        gpsLat: widget.data.gpsLat,
        submittedAt: widget.data.submittedAt,
        submittedBy: widget.data.submittedBy,
        submittedByName: widget.data.submittedByName,
        assignee: widget.data.assignee,
        assigneeId: widget.data.assigneeId,
        status: selectedAction ?? '',
        description: widget.data.description,
        closedAt: widget.data.closedAt,
        closedBy: widget.data.closedBy,
        closedByName: widget.data.closedByName,
        isClosed: widget.data.isClosed,
        isSynchronize: 0,
        isNewResponse: widget.data.isNewResponse,
        usingGps: widget.data.usingGps,
        attachments: widget.data.attachments,
      );

      await DatabaseAttachmentInspection.insertResponse(dataResponse);

      final isInternetExist =
          await InspectionService.isInternetConnectionExist();
      if (isInternetExist) {
        await createResponse(
          context,
          toDoInspection: dataInspection,
          responseInspection: dataResponse,
        );
      } else {
        await DatabaseResponseInspection.insertData(dataResponse);
        await DatabaseTodoInspection.updateData(dataInspection);
        _navigationService.pop();
      }

      // final dataHistory = HistoryInspectionModel(
      //   id: widget.data.id,
      //   code: responseId,
      //   trTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      //   submittedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      //   submittedBy: user.id,
      //   submittedByName: user.name,
      //   description: actionController.text,
      //   reassignedTo:
      //       selectedUserInspection != null ? selectedUserInspection!.id : '',
      //   reassignedToName:
      //       selectedUserInspection != null ? selectedUserInspection!.name : '',
      //   gpsLat: latitude,
      //   gpsLng: longitude,
      //   status: selectedAction ?? '',
      //   attachments: listInspectionPhoto,
      // );
      // listHistoryInspection.add(dataHistory);
      // final dataInspection = TicketInspectionModel(
      //   id: widget.data.id,
      //   code: widget.data.code,
      //   trTime: widget.data.trTime,
      //   mCompanyId: widget.data.mCompanyId,
      //   mCompanyName: widget.data.mCompanyName,
      //   mCompanyAlias: widget.data.mCompanyAlias,
      //   mTeamId: widget.data.mTeamId,
      //   mTeamName: widget.data.mTeamName,
      //   mDivisionId: widget.data.mDivisionId,
      //   mDivisionName: widget.data.mDivisionName,
      //   mDivisionEstateCode: widget.data.mDivisionEstateCode,
      //   gpsLng: widget.data.gpsLng,
      //   gpsLat: widget.data.gpsLat,
      //   submittedAt: widget.data.submittedAt,
      //   submittedBy: widget.data.submittedBy,
      //   submittedByName: widget.data.submittedByName,
      //   assignee: widget.data.assignee,
      //   assigneeId: widget.data.assigneeId,
      //   status: selectedAction ?? '',
      //   description: widget.data.description,
      //   closedAt: widget.data.closedAt,
      //   closedBy: widget.data.closedBy,
      //   closedByName: widget.data.closedByName,
      //   isClosed: widget.data.isClosed,
      //   isSynchronize: 0,
      //   isNewResponse: widget.data.isNewResponse,
      //   usingGps: widget.data.usingGps,
      //   attachments: widget.data.attachments,
      //   responses: listHistoryInspection,
      // );

      // await DatabaseAttachmentInspection.insertResponse(dataHistory);
      // final isInternetExist =
      //     await InspectionService.isInternetConnectionExist();
      // if (isInternetExist) {
      //   await createResponse(
      //     context,
      //     toDoInspection: dataInspection,
      //     responseInspection: dataInspection.responses.last,
      //   );
      // } else {
      //   await DatabaseTodoInspection.updateData(dataInspection);
      //   _navigationService.pop();
      // }
    }
  }

  @override
  void dispose() {
    descriptionController.dispose();
    actionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        return MediaQuery(
          data: Style.mediaQueryText(context),
          child: PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              if (didPop == false) {
                if (isPreviewPhoto ||
                    isShowDialogAttachment ||
                    isShowDialogSubmit) {
                  setState(() {
                    isPreviewPhoto = false;
                    isShowDialogAttachment = false;
                    isShowDialogSubmit = false;
                  });
                  _dialogService.popDialog();
                } else {
                  _navigationService.pop();
                }
              }
            },
            child: Scaffold(
              appBar: AppBar(title: const Text("Assignment Detail")),
              body: isLoading
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.data.code),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('Dibuat oleh :'),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Text(widget.data.submittedByName,
                                        textAlign: TextAlign.end))
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('Lokasi Inspection :'),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Text(
                                        '${widget.data.gpsLng},${widget.data.gpsLat}',
                                        textAlign: TextAlign.end))
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('Tanggal :'),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Text(widget.data.trTime,
                                        textAlign: TextAlign.end))
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('Kategori :'),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Text(widget.data.mTeamName,
                                        textAlign: TextAlign.end))
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('Company :'),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Text(widget.data.mCompanyAlias,
                                        textAlign: TextAlign.end))
                              ],
                            ),
                            if (widget.data.mDivisionEstateCode.isNotEmpty &&
                                widget.data.mDivisionName.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Text('Estate :'),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: Text(
                                                'Estate ${widget.data.mDivisionEstateCode}',
                                                textAlign: TextAlign.end))
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        const Text('Divisi :'),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: Text(
                                                widget.data.mDivisionName,
                                                textAlign: TextAlign.end))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('User Assign :'),
                                const SizedBox(width: 12),
                                Expanded(
                                    child: Text(widget.data.assignee,
                                        textAlign: TextAlign.end))
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text('Status :'),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    ConvertHelper.titleCase(widget.data.status
                                        .replaceAll(RegExp(r'_'), ' ')),
                                    textAlign: TextAlign.end,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Foto Inspection :'),
                                const SizedBox(height: 6),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width / 4,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listInspectionAttachment.length,
                                    itemBuilder: (context, index) {
                                      final image = base64Decode(
                                        listInspectionAttachment[index].image,
                                      );
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPreviewPhoto = true;
                                            });
                                            _dialogService
                                                .showDialogPreviewPhotoOffline(
                                              image: image,
                                              onTapClose: () {
                                                setState(() {
                                                  isPreviewPhoto = false;
                                                });
                                                _dialogService.popDialog();
                                              },
                                            );
                                          },
                                          child: Image.memory(
                                            image,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // SizedBox(
                                //   height: MediaQuery.of(context).size.width / 4,
                                //   child: ListView.builder(
                                //     scrollDirection: Axis.horizontal,
                                //     itemCount: widget.data.attachments.length,
                                //     itemBuilder: (context, index) {
                                //       final image = widget.data.attachments[index];
                                //       return Padding(
                                //         padding: const EdgeInsets.only(right: 8),
                                //         child: InkWell(
                                //           onTap: () {
                                //             setState(() {
                                //               isPreviewPhoto = true;
                                //             });
                                //             _dialogService.showDialogPreviewPhoto(
                                //               imagePath: image,
                                //               onTapClose: () {
                                //                 setState(() {
                                //                   isPreviewPhoto = false;
                                //                 });
                                //                 _dialogService.popDialog();
                                //               },
                                //             );
                                //           },
                                //           child: (image.toString().contains('http'))
                                //               ? FutureBuilder(
                                //                   future: InspectionService
                                //                       .isInternetConnectionExist(),
                                //                   builder: (context, snapshot) {
                                //                     if (snapshot.data == true) {
                                //                       return Image.network(
                                //                         image,
                                //                         width: MediaQuery.of(context)
                                //                                 .size
                                //                                 .width /
                                //                             4,
                                //                         height: MediaQuery.of(context)
                                //                                 .size
                                //                                 .width /
                                //                             4,
                                //                         fit: BoxFit.cover,
                                //                       );
                                //                     } else {
                                //                       return Container(
                                //                         width: MediaQuery.of(context)
                                //                                 .size
                                //                                 .width /
                                //                             4,
                                //                         height: MediaQuery.of(context)
                                //                                 .size
                                //                                 .width /
                                //                             4,
                                //                         color: Colors.orange,
                                //                       );
                                //                     }
                                //                   },
                                //                 )
                                //               : Image.file(
                                //                   File(image),
                                //                   width: MediaQuery.of(context)
                                //                           .size
                                //                           .width /
                                //                       4,
                                //                   height: MediaQuery.of(context)
                                //                           .size
                                //                           .width /
                                //                       4,
                                //                   fit: BoxFit.cover,
                                //                 ),
                                //         ),
                                //       );
                                //     },
                                //   ),
                                // ),
                                const SizedBox(height: 12),
                              ],
                            ),
                            const Text('Deskripsi :'),
                            const SizedBox(height: 6),
                            InputPrimary(
                              controller: descriptionController,
                              maxLines: 10,
                              validator: (value) => null,
                              readOnly: true,
                            ),
                            if (ConvertHelper.intToBool(widget.data.usingGps) &&
                                (widget.data.mCompanyAlias == 'SMM' ||
                                    widget.data.mCompanyAlias == 'ANJA' ||
                                    widget.data.mCompanyAlias == 'KAL' ||
                                    widget.data.mCompanyAlias == 'ANJAS'))
                              InkWell(
                                onTap: () {
                                  _navigationService.push(
                                    Routes.INSPECTION_LOCATION,
                                    arguments: {
                                      'longitude': widget.data.gpsLng,
                                      'latitude': widget.data.gpsLat,
                                      'company': widget.data.mCompanyAlias,
                                    },
                                  );
                                },
                                child: Card(
                                  color: Palette.primaryColorProd,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        "Lihat Lokasi Inspection",
                                        style: Style.whiteBold14,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(height: 6),
                            const Text('Riwayat Tindakan :'),
                            if (listResponseInspection.isNotEmpty)
                              ...listResponseInspection.map((item) {
                                final responseAttachment =
                                    listResponseAttachment[item.code];
                                return CardHistoryInspection(
                                  data: item,
                                  listResponseAttachment:
                                      responseAttachment ?? [],
                                  onPreviewPhoto: (value) {
                                    setState(() {
                                      isPreviewPhoto = true;
                                    });
                                    _dialogService
                                        .showDialogPreviewPhotoOffline(
                                      image: value,
                                      onTapClose: () {
                                        setState(() {
                                          isPreviewPhoto = false;
                                        });
                                        _dialogService.popDialog();
                                      },
                                    );
                                  },
                                );
                              })
                            else
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Center(
                                    child: Text('Belum Ada Riwayat Tindakan')),
                              ),
                            // if (widget.data.responses.isNotEmpty)
                            //   ...widget.data.responses.map((item) {
                            //     final responseAttachment =
                            //         listResponseAttachment[item.code];
                            //     return CardHistoryInspection(
                            //       data: item,
                            //       listResponseAttachment:
                            //           responseAttachment ?? [],
                            //       onPreviewPhoto: (value) {
                            //         setState(() {
                            //           isPreviewPhoto = true;
                            //         });
                            //         _dialogService
                            //             .showDialogPreviewPhotoOffline(
                            //           image: value,
                            //           onTapClose: () {
                            //             setState(() {
                            //               isPreviewPhoto = false;
                            //             });
                            //             _dialogService.popDialog();
                            //           },
                            //         );
                            //       },
                            //     );
                            //   }).toList()
                            // else
                            //   Padding(
                            //     padding:
                            //         const EdgeInsets.symmetric(vertical: 16),
                            //     child: Center(
                            //         child: const Text(
                            //             'Belum Ada Riwayat Tindakan')),
                            //   ),
                            if (ConvertHelper.intToBool(
                                widget.data.isSynchronize))
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(child: Text('Action :')),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: DropdownButton(
                                          isExpanded: true,
                                          hint: Text(
                                            "Pilih Action",
                                            style: Style.whiteBold14.copyWith(
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey),
                                          ),
                                          value: selectedAction,
                                          style: Style.whiteBold14.copyWith(
                                            fontWeight: FontWeight.normal,
                                            color: themeNotifier.status ==
                                                        true ||
                                                    MediaQuery.of(context)
                                                            .platformBrightness ==
                                                        Brightness.dark
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          items: listActionOption.map((value) {
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                  ConvertHelper.titleCase(
                                                      value.replaceAll(
                                                          RegExp(r'_'), ' '))),
                                            );
                                          }).toList(),
                                          onChanged: (String? value) {
                                            if (value != null) {
                                              selectedAction = value;
                                              selectedUserInspection = null;
                                              setState(() {});
                                            }
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  if (selectedAction == 'reassign')
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        children: [
                                          const Expanded(
                                              child: Text('User Re Assign :')),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () async {
                                                final data =
                                                    await _navigationService
                                                        .push(Routes
                                                            .INSPECTION_USER);
                                                selectedUserInspection = data;
                                                setState(() {});
                                                log('selected user reassign : $selectedUserInspection');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: themeNotifier
                                                                          .status ==
                                                                      true ||
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .platformBrightness ==
                                                                      Brightness
                                                                          .dark
                                                              ? Colors.white
                                                              : Colors.grey
                                                                  .shade400,
                                                          width: 0.5)),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: selectedUserInspection !=
                                                                null
                                                            ? Text(
                                                                selectedUserInspection!
                                                                    .name)
                                                            : Text(
                                                                'Pilih User',
                                                                style: TextStyle(
                                                                    color: themeNotifier.status ==
                                                                                true ||
                                                                            MediaQuery.of(context).platformBrightness ==
                                                                                Brightness
                                                                                    .dark
                                                                        ? Colors
                                                                            .grey
                                                                            .shade500
                                                                        : Colors
                                                                            .black
                                                                            .withOpacity(0.35)),
                                                              ),
                                                      ),
                                                      Icon(
                                                          Icons.arrow_drop_down,
                                                          color: themeNotifier.status ==
                                                                      true ||
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .platformBrightness ==
                                                                      Brightness
                                                                          .dark
                                                              ? Colors
                                                                  .grey.shade400
                                                              : Colors.grey
                                                                  .shade700)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  // Row(
                                  //   children: [
                                  //     Text('Lokasi Tindakan :'),
                                  //     SizedBox(width: 12),
                                  //     Expanded(
                                  //         child: Text('$longitude,$latitude',
                                  //             textAlign: TextAlign.end))
                                  //   ],
                                  // ),
                                  // SizedBox(height: 8),
                                  const Text('Tindakan :'),
                                  const SizedBox(height: 6),
                                  InputPrimary(
                                    controller: actionController,
                                    maxLines: 10,
                                    hintText: 'Masukkan Tindakan',
                                    keyboardType: TextInputType.multiline,
                                    validator: (value) => null,
                                  ),
                                  // SizedBox(height: 12),
                                  if (listInspectionPhoto.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            'Foto Tindakan Inspection :'),
                                        const SizedBox(height: 6),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                listInspectionPhoto.length,
                                            itemBuilder: (context, index) {
                                              final imagePath =
                                                  listInspectionPhoto[index];
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 12),
                                                child: InspectionPhoto(
                                                  imagePath: imagePath,
                                                  onTapView: () {
                                                    setState(() {
                                                      isPreviewPhoto = true;
                                                    });
                                                    _dialogService
                                                        .showDialogPreviewPhoto(
                                                      imagePath: imagePath,
                                                      onTapClose: () {
                                                        setState(() {
                                                          isPreviewPhoto =
                                                              false;
                                                        });
                                                        _dialogService
                                                            .popDialog();
                                                      },
                                                    );
                                                  },
                                                  onTapRemove: () {
                                                    listInspectionPhoto
                                                        .remove(imagePath);
                                                    setState(() {});
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                      ],
                                    ),
                                  InkWell(
                                    onTap: () {
                                      if (listInspectionPhoto.length < 5) {
                                        setState(() {
                                          isShowDialogAttachment = true;
                                        });
                                        _dialogService.showDialogAttachment(
                                          onTapCamera: () async {
                                            _dialogService.popDialog();
                                            setState(() {
                                              isShowDialogAttachment = false;
                                            });
                                            final result =
                                                await CameraService.getImage(
                                              context,
                                              imageSource: ImageSource.camera,
                                            );
                                            if (result != null) {
                                              listInspectionPhoto.add(result);
                                              setState(() {});
                                            }
                                          },
                                          onTapGallery: () async {
                                            _dialogService.popDialog();
                                            setState(() {
                                              isShowDialogAttachment = false;
                                            });
                                            final result =
                                                await CameraService.getImage(
                                              context,
                                              imageSource: ImageSource.gallery,
                                            );
                                            if (result != null) {
                                              listInspectionPhoto.add(result);
                                              setState(() {});
                                            }
                                          },
                                          onTapCancel: () {
                                            setState(() {
                                              isShowDialogAttachment = false;
                                            });
                                            _dialogService.popDialog();
                                          },
                                        );
                                      } else {
                                        FlushBarManager.showFlushBarWarning(
                                            _navigationService
                                                .navigatorKey.currentContext!,
                                            "Foto Inspection",
                                            "Maksimal 5 foto yang dapat Anda lampirkan");
                                      }
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      color: Colors.green,
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            "LAMPIRKAN FOTO",
                                            style: Style.whiteBold14,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isShowDialogSubmit = true;
                                      });
                                      showSubmitOption();
                                    },
                                    child: Card(
                                      color: Palette.primaryColorProd,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Text(
                                            "SUBMIT",
                                            style: Style.whiteBold14,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
