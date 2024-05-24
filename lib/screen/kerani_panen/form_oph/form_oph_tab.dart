// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/flushbar_manager.dart';
import 'package:epms/model/m_customer_code_schema.dart';
import 'package:epms/model/m_employee_schema.dart';
import 'package:epms/model/m_vendor_schema.dart';
import 'package:epms/screen/kerani_panen/form_oph/form_oph_notifier.dart';
import 'package:epms/screen/qr_reader/qr_reader_screen.dart';
import 'package:epms/screen/search/search_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class FormOPHTab extends StatefulWidget {
  const FormOPHTab({super.key});

  @override
  State<FormOPHTab> createState() => _FormOPHTabState();
}

class _FormOPHTabState extends State<FormOPHTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormOPHNotifier>(builder: (context, notifier, child) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("ID OPH:"),
                      Text(notifier.ophID, style: Style.textBold16)
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
                    const Text("GPS Geolocation:"),
                    Expanded(
                        child: Text(
                      notifier.gpsLocation,
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Jenis Pekerja:"),
                    Flexible(
                      child: SizedBox(
                        width: 140,
                        child: DropdownButton(
                          isExpanded: true,
                          value: notifier.employeeType,
                          items: notifier.listEmployeeType.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            notifier.onSetEmployeeType(value!);
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
                    const Text("Apakah panen mekanis?"),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: notifier.isChecked,
                          onChanged: (bool? value) {
                            notifier.onSetHarvestingMethod(value!);
                          },
                        ),
                        const Text("Ya")
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Kemandoran:"),
                    notifier.employeeType == "Kontrak"
                        ? Row(
                            children: [
                              SizedBox(
                                width: 180,
                                child: DropdownButton(
                                  isExpanded: true,
                                  hint: const Text("Pilih Mandor"),
                                  value: notifier.valueMandorKontrak,
                                  items:
                                      notifier.listMandorKontrak.map((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value.employeeName!),
                                    );
                                  }).toList(),
                                  onChanged: (MEmployeeSchema? value) {
                                    notifier.onSetMandorKontrak(value!);
                                  },
                                ),
                              ),
                              InkWell(
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 2.0),
                                  child: Icon(Icons.search),
                                ),
                                onTap: () async {
                                  MEmployeeSchema? mEmployee =
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchEmployeeScreen()));
                                  notifier.onSetMandorKontrak(mEmployee!);
                                },
                              ),
                            ],
                          )
                        : Container(
                            alignment: Alignment.centerRight,
                            width: 160,
                            child: Text(
                              "${notifier.supervisor?.mandorCode ?? ""}/${notifier.supervisor?.mandorName ?? ""}",
                              textAlign: TextAlign.end,
                            ))
                  ],
                ),
              ),
              notifier.employeeType == "Internal" ||
                      notifier.employeeType == "Pinjam"
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(child: Text("Pekerja:")),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 140,
                                  child: DropdownButton(
                                    isExpanded: true,
                                    hint: const Text("Pilih Pekerja"),
                                    value: notifier.valueEmployee,
                                    items: notifier.listEmployee.map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value.employeeName!),
                                      );
                                    }).toList(),
                                    onChanged: (MEmployeeSchema? value) {
                                      notifier.onSetEmployee(value!);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 2.0),
                                      child: Icon(Icons.search),
                                    ),
                                    onTap: () async {
                                      MEmployeeSchema? mEmployee =
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SearchEmployeeScreen()));
                                      notifier.onSetEmployee(mEmployee!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              notifier.employeeType == "Pinjam"
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(child: Text("Customer:")),
                          Flexible(
                            child: SizedBox(
                              width: 170,
                              child: DropdownButton(
                                isExpanded: true,
                                hint: const Text("Pilih Customer"),
                                value: notifier.valueMCustomer,
                                items: notifier.listMCustomer.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.customerCode!),
                                  );
                                }).toList(),
                                onChanged: (MCustomerCodeSchema? value) {
                                  notifier.onSetCustomer(value!);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              notifier.employeeType == "Kontrak"
                  ? Padding(
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
                                value: notifier.valueVendor,
                                items: notifier.listVendor.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.vendorName!),
                                  );
                                }).toList(),
                                onChanged: (MVendorSchema? value) {
                                  notifier.onSetVendor(value!);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Estate:"),
                      notifier.employeeType == "Pinjam"
                          ? Text(notifier.valueMCustomer?.customerPlantCode!
                                  .substring(2) ??
                              "Belum memilih customer")
                          : Text("${notifier.mConfigSchema?.estateCode}")
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Blok:"),
                    Flexible(
                      child: SizedBox(
                        width: 160,
                        child: Focus(
                          child: TextFormField(
                            controller: notifier.blockNumber,
                            textAlign: TextAlign.center,
                            textCapitalization: TextCapitalization.characters,
                            decoration:
                                const InputDecoration(hintText: "Tulis blok"),
                            onChanged: (value) {
                              if (value.length >= 3) {
                                notifier.blockNumberCheck(context, value);
                              }
                              if (value.isEmpty) {
                                notifier.blockNumberCheck(context, value);
                              }
                            },
                            onFieldSubmitted: (value) {
                              notifier.blockNumberCheck(context, value);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              notifier.employeeType == "Pinjam"
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(child: Text("Divisi:")),
                          Text(notifier.mBlockSchema?.blockDivisionCode ??
                              "Belum mengisi blok")
                        ],
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Estimasi Berat OPH (Kg):"),
                    Text("${notifier.ophEstimationWeight}")
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text("TPH"),
                        SizedBox(
                          width: 160,
                          child: Focus(
                            child: TextFormField(
                              controller: notifier.tphNumber,
                              textAlign: TextAlign.center,
                              textCapitalization: TextCapitalization.characters,
                              decoration: const InputDecoration(
                                  hintText: "Tulis Nomor TPH"),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  notifier.tPHNumberCheck(context, value);
                                }
                              },
                              onFieldSubmitted: (value) {
                                notifier.tPHNumberCheck(context, value);
                              },
                            ),
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
                                  notifier.tphNumber =
                                      TextEditingController(text: result);
                                  notifier.tPHNumberCheck(context, result);
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
                                  "BACA QR TPH",
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
                    child: Column(
                      children: [
                        const Text("Kartu OPH"),
                        SizedBox(
                          width: 160,
                          child: Focus(
                            child: TextFormField(
                              controller: notifier.ophNumber,
                              textAlign: TextAlign.center,
                              textCapitalization: TextCapitalization.characters,
                              decoration: const InputDecoration(
                                  hintText: "Tulis Kartu OPH"),
                              onChanged: (value) {
                                if (value.length >= 4) {
                                  notifier.cardOPHNumberCheck(context, value);
                                }
                              },
                              onFieldSubmitted: (value) {
                                notifier.cardOPHNumberCheck(context, value);
                              },
                            ),
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
                                  notifier.ophNumber =
                                      TextEditingController(text: result);
                                  notifier.cardOPHNumberCheck(context, result);
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
                                  "BACA QR KARTU",
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
                ],
              ),
              notifier.pickedFile != null
                  ? Image.file(File("${notifier.pickedFile}"), height: 400)
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
                          "FOTO HASIL PANEN",
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
                  onTap: () async {
                    if (await Permission
                        .locationWhenInUse.serviceStatus.isEnabled) {
                      notifier.checkFormGenerator(context);
                    } else {
                      FlushBarManager.showFlushBarWarning(
                          context,
                          "Gps Tidak Aktif",
                          "Mohon mengaktifkan fitur gps pada perangkat Anda");
                    }
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
            ],
          ),
        ),
      );
    });
  }
}
