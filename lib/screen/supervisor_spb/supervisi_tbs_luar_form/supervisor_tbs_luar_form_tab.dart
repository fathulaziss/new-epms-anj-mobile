import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/model/m_vendor_schema.dart';
import 'package:epms/screen/qr_reader/qr_reader_screen.dart';
import 'package:epms/screen/supervisor_spb/supervisi_tbs_luar_form/supervisor_tbs_luar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorTBSLuarFormTab extends StatefulWidget {
  const SupervisorTBSLuarFormTab({super.key});

  @override
  State<SupervisorTBSLuarFormTab> createState() =>
      _SupervisorTBSLuarFormTabState();
}

class _SupervisorTBSLuarFormTabState extends State<SupervisorTBSLuarFormTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorTBSLuarNotifier>(
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
                    Text(notifier.supervisiTBSID, style: Style.textBold16)
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tanggal:"),
                  Text("${notifier.date} ${notifier.time}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Nama:"),
                  Text("${notifier.mConfigSchema?.employeeName}")
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Quantity:"),
                  Flexible(
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        controller: notifier.quantity,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(hintText: "Quantity"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Contract No:"),
                  Flexible(
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        controller: notifier.contractNumber,
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(hintText: "No Kontrak"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Supplier:"),
                  Flexible(
                    child: SizedBox(
                      width: 200,
                      child: DropdownButton(
                        isExpanded: true,
                        hint: const Text("Pilih Supplier"),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Driver:"),
                  Flexible(
                    child: SizedBox(
                      width: 200,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        controller: notifier.driver,
                        textAlign: TextAlign.center,
                        decoration:
                            const InputDecoration(hintText: "Nama Supir"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                              const Text("No ID DO"),
                              SizedBox(
                                width: 160,
                                child: Focus(
                                  child: TextFormField(
                                    enabled: notifier.activeText,
                                    controller: notifier.deliveryID,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    onChanged: (value) {
                                      if (value.length >= 17) {}
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
                      Padding(
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
                    ],
                  ),
                ),
              ],
            ),
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
                        "FOTO HASIL GRADING",
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
