import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/model/m_division_schema.dart';
import 'package:epms/model/m_employee_schema.dart';
import 'package:epms/model/m_estate_schema.dart';
import 'package:epms/model/m_vendor_schema.dart';
import 'package:epms/screen/inspection/components/inspection_photo.dart';
import 'package:epms/screen/qr_reader/qr_reader_screen.dart';
import 'package:epms/screen/search/search_driver_screen.dart';
import 'package:epms/screen/supervisor_spb/supervisi_spb_form/supervisor_spb_form_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorSPBFormTab extends StatefulWidget {
  const SupervisorSPBFormTab({super.key});

  @override
  State<SupervisorSPBFormTab> createState() => _SupervisorSPBFormTabState();
}

class _SupervisorSPBFormTabState extends State<SupervisorSPBFormTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorSPBFormNotifier>(
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
                    Text(notifier.supervisiID, style: Style.textBold16)
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Tanggal:"), Text(notifier.date)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Nama:"),
                  Text(notifier.mConfigSchema?.employeeName ?? "")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("GPS Geolocation:"),
                  Text(notifier.gpsLocation)
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
                        Flexible(
                          child: SizedBox(
                            width: 140,
                            child: DropdownButton(
                              isExpanded: true,
                              value: notifier.sourceSPBValue,
                              items: notifier.sourceSPB.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                notifier.onChangeSourceSPB(value!);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    notifier.sourceSPBValue == "Internal"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Jenis Pekerja:"),
                              Flexible(
                                child: SizedBox(
                                  width: 140,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    value: notifier.employeeTypeValue,
                                    items: notifier.employeeType.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      notifier.onChangeTypeEmployee(value!);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    const SizedBox(height: 8),
                    notifier.sourceSPBValue == "External"
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Driver:"),
                                Flexible(
                                  child: SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      controller: notifier.driverTBSLuar,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          hintText: "Nama Supir"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    notifier.sourceSPBValue == "Internal" &&
                            notifier.employeeTypeValue == "Internal"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Nama Supir:"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 180,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      icon: const Visibility(
                                          visible: false,
                                          child: Icon(Icons.arrow_downward)),
                                      hint: const Text("Nama Supir"),
                                      value: notifier.driver,
                                      items: notifier.listDriver.map((value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value.employeeName!,
                                            style: Style.textBold14,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: null,
                                    ),
                                  ),
                                  InkWell(
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.search),
                                    ),
                                    onTap: () async {
                                      MEmployeeSchema? mEmployee =
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SearchDriverScreen()));
                                      notifier.onSetDriver(mEmployee!);
                                    },
                                  ),
                                ],
                              )
                            ],
                          )
                        : Container(),
                    const SizedBox(height: 8),
                    notifier.employeeTypeValue == "Kontrak" ||
                            notifier.sourceSPBValue == "External"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Vendor:"),
                              Flexible(
                                child: SizedBox(
                                  width: 200,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: const Text("Pilih Vendor"),
                                    value: notifier.vendor,
                                    items: notifier.listVendor.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text("${value.vendorName}"),
                                      );
                                    }).toList(),
                                    onChanged: (MVendorSchema? value) {
                                      notifier.onChangeVendor(value!);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    const SizedBox(height: 8),
                    notifier.employeeTypeValue == "Kontrak" ||
                            notifier.sourceSPBValue == "External"
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  value: notifier.isChecked,
                                  onChanged: (bool? value) {
                                    notifier.onChangeChecked(value!);
                                  },
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      enabled: notifier.isChecked,
                                      controller: notifier.vendorOther,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          hintText: "Tulis Vendor"),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    const SizedBox(height: 8),
                    notifier.sourceSPBValue == "Internal"
                        ? Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Estate Code:"),
                                Flexible(
                                  child: SizedBox(
                                    width: 140,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      hint: const Text("Pilih Estate"),
                                      value: notifier.mEstateSchemaValue,
                                      items: notifier.listMEstateSchema
                                          .map((value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text("${value.estateCode}"),
                                        );
                                      }).toList(),
                                      onChanged: (MEstateSchema? value) {
                                        notifier.onChangeEstateSchema(value!);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ]),
            ),
            notifier.sourceSPBValue == "Internal"
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Divisi:"),
                        Flexible(
                          child: SizedBox(
                            width: 140,
                            child: DropdownButton(
                              isExpanded: true,
                              hint: const Text("Pilih Divisi"),
                              value: notifier.division,
                              items: notifier.listDivision.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text("${value.divisionCode}"),
                                );
                              }).toList(),
                              onChanged: (MDivisionSchema? value) {
                                notifier.onChangeDivision(value!);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            const SizedBox(height: 20),
            Column(
              children: [
                const Text("Nomor Kendaraan"),
                SizedBox(
                  width: 160,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    controller: notifier.vehicleNumber,
                    textAlign: TextAlign.center,
                    decoration:
                        const InputDecoration(hintText: "Tulis No. Kendaraan"),
                  ),
                ),
                if (notifier.sourceSPBValue == 'Internal')
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        String? result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QRReaderScreen()));
                        if (result != null) {
                          setState(() {
                            notifier.vehicleNumber =
                                TextEditingController(text: result);
                          });
                        }
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "BACA QR Truk",
                            style: Style.whiteBold14,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 10),
            Row(
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
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    onChanged: (value) {
                                      if (value.length >= 17) {
                                        notifier.checkDONumber(value);
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        hintText: "Tulis No Kartu SPB"),
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
                                    activeColor: Palette.greenColor,
                                    value: notifier.activeText,
                                    onChanged: (value) {
                                      notifier.onChangeActiveText(value);
                                    }),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 18),
                      notifier.sourceSPBValue == "External"
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async {
                                  String? result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const QRReaderScreen()));
                                  if (result != null) {
                                    notifier.setQRResult(result);
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Scan QR DO",
                                      style: Style.whiteBold14,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  notifier.dialogNFC(context);
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
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
            ),
            if (notifier.sourceSPBValue == 'Internal')
              if (notifier.listPickedFile.isNotEmpty)
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
                const SizedBox()
            else
              notifier.pickedFile != null
                  ? Image.file(
                      File("${notifier.pickedFile}"),
                      height: 400,
                    )
                  : Container(),
            Padding(
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
                        "FOTO HASIL SUPERVISI",
                        style: Style.whiteBold14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
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
            ),
          ]),
        ),
      );
    });
  }
}
