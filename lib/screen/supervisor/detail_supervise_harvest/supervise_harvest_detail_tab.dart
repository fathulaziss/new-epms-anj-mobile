import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/model/m_employee_schema.dart';
import 'package:epms/screen/search/search_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_supervise_harvest_notifier.dart';

class SuperviseHarvestDetailTab extends StatefulWidget {
  const SuperviseHarvestDetailTab({super.key});

  @override
  State<SuperviseHarvestDetailTab> createState() =>
      _SuperviseHarvestDetailTabState();
}

class _SuperviseHarvestDetailTabState extends State<SuperviseHarvestDetailTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailSuperviseHarvestNotifier>(
        builder: (context, notifier, child) {
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
                      const Text("ID Supervisi:"),
                      Text("${notifier.ophSupervise?.ophSupervisiId}",
                          style: Style.textBold16)
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tanggal:"),
                    Text(
                        "${notifier.ophSupervise?.createdDate} ${notifier.ophSupervise?.createdTime}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("GPS Latitude:"),
                    Text("${notifier.ophSupervise?.supervisiLat}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("GPS Longitude:"),
                    Text("${notifier.ophSupervise?.supervisiLong}")
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
                          notifier.onEdit
                              ? InkWell(
                                  onTap: () async {
                                    MEmployeeSchema? mEmployee =
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SearchEmployeeScreen()));
                                    notifier.onSetKemandoran(mEmployee!);
                                  },
                                  child: const Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.search),
                                    ),
                                  ),
                                )
                              : Container()
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
                            notifier.onEdit
                                ? InkWell(
                                    onTap: () async {
                                      MEmployeeSchema? mEmployee =
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SearchEmployeeScreen()));
                                      notifier.onSetKeraniPanen(mEmployee!);
                                    },
                                    child: const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.search),
                                      ),
                                    ),
                                  )
                                : Container()
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
                            notifier.onEdit
                                ? InkWell(
                                    onTap: () async {
                                      MEmployeeSchema? mEmployee =
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SearchEmployeeScreen()));
                                      notifier.onSetPemanen(mEmployee!);
                                    },
                                    child: const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(Icons.search),
                                      ),
                                    ),
                                  )
                                : Container()
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
                                  child: Text(
                                      "${notifier.pemanen?.employeeName}",
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
                    Text("${notifier.ophSupervise?.supervisiEstateCode}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Divisi:"),
                    Text("${notifier.ophSupervise?.supervisiDivisionCode}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("OPH ID:"),
                    Text("${notifier.ophSupervise?.ophId}")
                  ],
                ),
              ),
              const SizedBox(height: 10),
              notifier.ophSupervise?.supervisiPhoto != null
                  ? Image.file(File("${notifier.ophSupervise?.supervisiPhoto}"),
                      height: 400)
                  : Container(),
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
                                )),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 10),
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
            ],
          ),
        ),
      );
    });
  }
}
