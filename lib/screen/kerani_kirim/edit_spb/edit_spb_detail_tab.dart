import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/model/m_employee_schema.dart';
import 'package:epms/model/m_vendor_schema.dart';
import 'package:epms/screen/kerani_kirim/edit_spb/edit_spb_notifier.dart';
import 'package:epms/screen/qr_reader/qr_reader_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditSPBDetailTab extends StatefulWidget {
  const EditSPBDetailTab({super.key});

  @override
  State<EditSPBDetailTab> createState() => _EditSPBDetailTabState();
}

class _EditSPBDetailTabState extends State<EditSPBDetailTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EditSPBNotifier>(builder: (context, editSPB, child) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("ID OPH:"),
                  Expanded(
                    child: Text(
                      editSPB.globalSPB.spbId ?? "",
                      style: Style.textBold16,
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tanggal:"),
                  Expanded(
                      child: Text(
                    editSPB.globalSPB.createdDate ?? "",
                    textAlign: TextAlign.end,
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("GPS Geolocation:"),
                  Expanded(
                    child: Text(
                      "${editSPB.globalSPB.spbLat}, ${editSPB.globalSPB.spbLong}",
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Jenis Pengangkutan:"),
                  Flexible(
                    child: SizedBox(
                      width: 140,
                      child: DropdownButton(
                        isExpanded: true,
                        value: editSPB.typeDeliverValue,
                        items: editSPB.typeDeliver.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          editSPB.onChangeDeliveryType(value!);
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
                    const Text("Tujuan:"),
                    Expanded(
                      child: Text(
                        "${editSPB.globalSPB.spbDeliverToCode} ${editSPB.globalSPB.spbDeliverToName}",
                        textAlign: TextAlign.end,
                      ),
                    )
                  ]),
            ),
            editSPB.typeDeliverValue == "Internal"
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(child: Text("Supir:")),
                          Flexible(
                            child: SizedBox(
                              width: 180,
                              child: DropdownButton(
                                isExpanded: true,
                                hint: const Text("Pilih Supir"),
                                value: editSPB.driverNameValue,
                                items: editSPB.driverNameList.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.employeeName!),
                                  );
                                }).toList(),
                                onChanged: (MEmployeeSchema? value) {
                                  editSPB.onChangeDriver(value!);
                                },
                              ),
                            ),
                          ),
                        ]),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(child: Text("Vendor:")),
                          Flexible(
                            child: SizedBox(
                              width: 180,
                              child: DropdownButton(
                                isExpanded: true,
                                hint: const Text("Pilih Vendor"),
                                value: editSPB.vendorSchemaValue,
                                items: editSPB.vendorList.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.vendorName!),
                                  );
                                }).toList(),
                                onChanged: !editSPB.isOthersVendor
                                    ? (MVendorSchema? value) {
                                        editSPB.onChangeVendor(value!);
                                      }
                                    : null,
                              ),
                            ),
                          ),
                        ]),
                  ),
            editSPB.typeDeliverValue == "Kontrak"
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("Lainnya:"),
                            Checkbox(
                              checkColor: Colors.white,
                              value: editSPB.isOthersVendor,
                              onChanged: (bool? value) {
                                editSPB.onCheckOtherVendor(value!);
                              },
                            )
                          ],
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 180,
                            child: TextFormField(
                              enabled: editSPB.isOthersVendor,
                              controller: editSPB.vendorOther,
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
            const SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("No. Kendaraan"),
                        SizedBox(
                          width: 160,
                          child: TextFormField(
                            onFieldSubmitted: (value) {
                              editSPB.checkVehicle(
                                  context, editSPB.vehicleNumber.text);
                            },
                            onChanged: (value) {
                              if (value.length >= 8) {
                                editSPB.checkVehicle(context, value);
                              }
                            },
                            controller: editSPB.vehicleNumber,
                            textAlign: TextAlign.center,
                            textCapitalization: TextCapitalization.characters,
                            decoration: const InputDecoration(
                                hintText: "Tulis No Kendaraan"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
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
                                setState(() {
                                  editSPB.vehicleNumber =
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
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(children: [
                      const Text("Kartu SPB"),
                      SizedBox(
                          width: 160,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "${editSPB.globalSPB.spbCardId}",
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ]),
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total OPH:"),
                    Text("${editSPB.listSPBDetail.length}")
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total janjang:"),
                    Text("${editSPB.globalSPB.spbTotalBunches}")
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total brondolan (kg):"),
                    Text("${editSPB.globalSPB.spbTotalLooseFruit}")
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Estimasi berat (kg):"),
                    Text("${editSPB.globalSPB.spbEstimateTonnage}")
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sisa kapasitas truk (kg):"),
                    Text("${editSPB.globalSPB.spbCapacityTonnage ?? 0}")
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Berat aktual (Kg):"),
                  Text("${editSPB.globalSPB.spbActualTonnage ?? "0"}")
                ],
              ),
            ),
            Column(children: [
              const Text("Catatan"),
              Text("${editSPB.globalSPB.spbDeliveryNote}"),
            ]),
            editSPB.globalSPB.spbPhoto != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      File("${editSPB.globalSPB.spbPhoto}"),
                      height: 400,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Container();
                      },
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  editSPB.getCamera(context);
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
                        "AMBIL FOTO",
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
                  editSPB.onClickSaveSPB(context);
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
