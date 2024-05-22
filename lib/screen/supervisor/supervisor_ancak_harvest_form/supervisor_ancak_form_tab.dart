import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/model/m_ancak_employee.dart';
import 'package:epms/model/m_employee_schema.dart';
import 'package:epms/screen/search/search_ancak_employee_screen.dart';
import 'package:epms/screen/search/search_employee_screen.dart';
import 'package:epms/screen/supervisor/supervisor_ancak_harvest_form/supervisor_ancak_harvest_form_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorAncakFormTab extends StatefulWidget {
  const SupervisorAncakFormTab({super.key});

  @override
  State<SupervisorAncakFormTab> createState() => _SupervisorAncakFormTabState();
}

class _SupervisorAncakFormTabState extends State<SupervisorAncakFormTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorAncakFormNotifier>(
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
                    const Text("ID Ancak:"),
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
                  const Text("GPS Geolocation End:"),
                  Text(notifier.gpsLocationUpdate)
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
                                child: Text("${notifier.pemanen?.employeeCode}",
                                    textAlign: TextAlign.center),
                              ),
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Assign To:"),
                          InkWell(
                            onTap: () async {
                              MAncakEmployee? mAncakEmployee =
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchAncakEmployeeScreen()));
                              if (mAncakEmployee != null) {
                                notifier.onSetAncakEmployee(mAncakEmployee);
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
                    notifier.ancakEmployee != null
                        ? Table(border: TableBorder.all(), children: [
                            const TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("User ID",
                                    textAlign: TextAlign.center),
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
                                child: Text("${notifier.ancakEmployee?.userId}",
                                    textAlign: TextAlign.center),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    "${notifier.ancakEmployee?.userName}",
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
                          textCapitalization: TextCapitalization.characters,
                          controller: notifier.blockCode,
                          textAlign: TextAlign.center,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Losses buah tinggal (janjang/pokok):"),
                  Text("${notifier.loosesBuahTinggal}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Losses brondolan (butir/pokok):"),
                  Text("${notifier.loosesBrondolan}")
                ],
              ),
            ),
            const SizedBox(height: 10),
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
                  notifier.getLocationUpdate();
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
                        "UPDATE LOKASI",
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
