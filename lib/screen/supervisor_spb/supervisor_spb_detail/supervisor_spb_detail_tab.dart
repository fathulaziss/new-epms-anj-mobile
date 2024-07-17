import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/value_service.dart';
import 'package:epms/screen/inspection/components/inspection_photo.dart';
import 'package:epms/screen/supervisor_spb/supervisor_spb_detail/supervisor_spb_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorSPBDetailTab extends StatefulWidget {
  const SupervisorSPBDetailTab({super.key});

  @override
  State<SupervisorSPBDetailTab> createState() => _SupervisorSPBDetailTabState();
}

class _SupervisorSPBDetailTabState extends State<SupervisorSPBDetailTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorSPBDetailNotifier>(
        builder: (context, notifier, child) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("ID Supervisi:"),
                    Text("${notifier.spbSupervise.spbSuperviseId}",
                        style: Style.textBold16)
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tanggal:"),
                  Text("${notifier.spbSupervise.createdDate}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Nama:"),
                  Text("${notifier.spbSupervise.supervisiSpbEmployeeName}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("GPS Geolocation:"),
                  Text(
                      "${notifier.spbSupervise.supervisiSpbLat ?? ""}, ${notifier.spbSupervise.supervisiSpbLong ?? ""}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Sumber SPB:"),
                        Text(
                            "${notifier.spbSupervise.supervisiSpbType != null ? ValueService.spbSourceDataText(notifier.spbSupervise.supervisiSpbType!) : ""}")
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jenis Pekerja:"),
                        Text(
                            "${notifier.spbSupervise.supervisiSpbMethod != null ? ValueService.typeOfFormToText(notifier.spbSupervise.supervisiSpbMethod!) : ""}")
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Nama Supir:"),
                        Text(
                            "${notifier.spbSupervise.supervisiSpbDriverEmployeeCode},\n${notifier.spbSupervise.supervisiSpbDriverEmployeeName}")
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Divisi:"),
                        Text(
                            "${notifier.spbSupervise.supervisiSpbDivisionCode}")
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("No Kendaraan:"),
                        Text(
                            "${notifier.spbSupervise.supervisiSpbLicenseNumber}")
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Estate:"),
                        Text("${notifier.spbSupervise.supervisiEstateCode}")
                      ],
                    ),
                    const SizedBox(height: 8),
                    notifier.onEdit
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            const Text("No ID SPB"),
                                            SizedBox(
                                              width: 160,
                                              child: Focus(
                                                child: TextFormField(
                                                  enabled: notifier.activeText,
                                                  controller: notifier.spbID,
                                                  textAlign: TextAlign.center,
                                                  decoration: const InputDecoration(
                                                      hintText:
                                                          "Tulis No Kartu SPB"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Text("Aktifkan Tulisan"),
                                            SizedBox(
                                              width: 160,
                                              child: Switch(
                                                  activeColor:
                                                      Palette.greenColor,
                                                  value: notifier.activeText,
                                                  onChanged: (value) {
                                                    notifier.onChangeActiveText(
                                                        value);
                                                  }),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          notifier.dialogNFC(context);
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          color: Colors.green,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              "Scan SPB",
                                              style: Style.whiteBold14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("No ID SPB:"),
                              Text("${notifier.spbSupervise.spbId}")
                            ],
                          ),
                  ]),
            ),
            const SizedBox(height: 10),
            if (notifier.listPickedFile.isNotEmpty)
              if (notifier.onEdit)
                SizedBox(
                  height: MediaQuery.of(context).size.width / 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: notifier.listPickedFile.length,
                    itemBuilder: (context, index) {
                      final imagePath = notifier.listPickedFile[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: InspectionPhoto(
                          imagePath: imagePath,
                          onTapView: () {
                            notifier.dialogService.showDialogPreviewPhoto(
                              imagePath: imagePath,
                              onTapClose: () {
                                notifier.dialogService.popDialog();
                              },
                            );
                          },
                          onTapRemove: () {
                            notifier.removeListPickedFile(imagePath);
                          },
                        ),
                      );
                    },
                  ),
                )
              else
                SizedBox(
                  height: MediaQuery.of(context).size.width / 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: notifier.listPickedFile.length,
                    itemBuilder: (context, index) {
                      final image = notifier.listPickedFile[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: InkWell(
                          onTap: () {
                            notifier.dialogService.showDialogPreviewPhoto(
                              imagePath: image,
                              onTapClose: () {
                                notifier.dialogService.popDialog();
                              },
                            );
                          },
                          child: Image.file(
                            File(image),
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            // notifier.spbSupervise.supervisiSpbPhoto != null
            //     ? Image.file(
            //         File("${notifier.spbSupervise.supervisiSpbPhoto}"),
            //         height: 400,
            //       )
            //     : Container(),
            notifier.onEdit
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        notifier.getCamera(context);
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "FOTO HASIL PANEN",
                              style: Style.whiteBold14,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            notifier.onEdit
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        notifier.showDialogQuestion(context);
                      },
                      child: Card(
                        color: Palette.primaryColorProd,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                            "SIMPAN",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        notifier.onChangeEdit();
                      },
                      child: Card(
                        color: Palette.primaryColorProd,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                            "UBAH DATA",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
          ]),
        ),
      );
    });
  }
}
