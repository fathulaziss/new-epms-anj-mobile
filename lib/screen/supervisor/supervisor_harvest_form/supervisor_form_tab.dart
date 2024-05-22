import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/model/m_employee_schema.dart';
import 'package:epms/screen/qr_reader/qr_reader_screen.dart';
import 'package:epms/screen/search/search_employee_screen.dart';
import 'package:epms/screen/supervisor/supervisor_harvest_form/supervisor_harvest_form_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorFormTab extends StatefulWidget {
  const SupervisorFormTab({super.key});

  @override
  State<SupervisorFormTab> createState() => _SupervisorFormTabState();
}

class _SupervisorFormTabState extends State<SupervisorFormTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorHarvestFormNotifier>(
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
                    const Text("Supervisi ID:"),
                    Text(notifier.harvestingID, style: Style.textBold16)
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
                  const Text("Name:"),
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Kemandoran:"),
                        InkWell(
                          onTap: () async {
                            MEmployeeSchema? mEmployee = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchEmployeeScreen()));
                            if (mEmployee != null) {
                              notifier.onSetKemandoran(mEmployee);
                            }
                          },
                          child: const Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.search),
                            ),
                          ),
                        )
                      ],
                    ),
                    notifier.kemandoran != null
                        ? Table(border: TableBorder.all(), children: [
                            const TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Text("Kode", textAlign: TextAlign.center),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Text('Nama', textAlign: TextAlign.center),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "${notifier.kemandoran?.employeeCode}",
                                    textAlign: TextAlign.center),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "${notifier.kemandoran?.employeeName}",
                                    textAlign: TextAlign.center),
                              ),
                            ]),
                          ])
                        : Container()
                  ]),
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
                          const Text("Kerani Panen:"),
                          InkWell(
                            onTap: () async {
                              MEmployeeSchema? mEmployee = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchEmployeeScreen()));
                              if (mEmployee != null) {
                                notifier.onSetKeraniPanen(mEmployee);
                              }
                            },
                            child: const Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.search),
                              ),
                            ),
                          )
                        ]),
                    notifier.keraniPanen != null
                        ? Table(border: TableBorder.all(), children: [
                            const TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Text("Kode", textAlign: TextAlign.center),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Text('Nama', textAlign: TextAlign.center),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "${notifier.keraniPanen?.employeeCode}",
                                    textAlign: TextAlign.center),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "${notifier.keraniPanen?.employeeName}",
                                    textAlign: TextAlign.center),
                              ),
                            ]),
                          ])
                        : Container()
                  ]),
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
                          const Text("Pemanen:"),
                          InkWell(
                            onTap: () async {
                              MEmployeeSchema? mEmployee = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchEmployeeScreen()));
                              if (mEmployee != null) {
                                notifier.onSetPemanen(mEmployee);
                              }
                            },
                            child: const Card(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.search),
                              ),
                            ),
                          )
                        ]),
                    notifier.pemanen != null
                        ? Table(border: TableBorder.all(), children: [
                            const TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Text('Nama', textAlign: TextAlign.center),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${notifier.pemanen?.employeeName}",
                                    textAlign: TextAlign.center),
                              ),
                            ]),
                          ])
                        : Container()
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Estate Code:"),
                  Text("${notifier.mConfigSchema?.estateCode}")
                ],
              ),
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
                          controller: notifier.blockCode,
                          textAlign: TextAlign.center,
                          textCapitalization: TextCapitalization.characters,
                          decoration:
                              const InputDecoration(hintText: "Tulis blok"),
                          onChanged: (value) {
                            if (value.length >= 3) {
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
            Column(
              children: [
                const Text("TPH"),
                SizedBox(
                  width: 160,
                  child: Focus(
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length >= 2) {
                          notifier.tPHNumberCheck(context, value);
                        }
                      },
                      controller: notifier.tphCode,
                      textCapitalization: TextCapitalization.characters,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: "Tulis Nomor TPH"),
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
                              builder: (context) => const QRReaderScreen()));
                      if (result != null) {
                        setState(() {
                          notifier.tphCode =
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
                          "BACA QR TPH",
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
                              const Text("No ID OPH"),
                              SizedBox(
                                width: 160,
                                child: Focus(
                                  child: TextFormField(
                                    enabled: notifier.activeText,
                                    controller: notifier.ophID,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        hintText: "Tulis No ID OPH"),
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
                                      notifier.onSetActiveText(value);
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
                                "Scan Kartu OPH",
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
                onTap: () {
                  notifier.onCheckFormGenerator(context);
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
