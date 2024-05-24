import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/value_service.dart';
import 'package:epms/screen/kerani_panen/detail_oph/detail_oph_notifier.dart';
import 'package:epms/screen/qr_reader/qr_reader_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailOPHTab extends StatefulWidget {
  const DetailOPHTab({super.key});

  @override
  State<DetailOPHTab> createState() => _DetailOPHTabState();
}

class _DetailOPHTabState extends State<DetailOPHTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailOPHNotifier>(builder: (context, notifier, child) {
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
                  Text(
                    notifier.oph.ophId ?? "",
                    style: Style.textBold20,
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
                  Text(
                      "${notifier.oph.createdDate ?? ""} ${notifier.oph.createdTime ?? ""}")
                ],
              ),
            ),
            !notifier.isExist
                ? Container()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("GPS Latitude:"),
                            Text(notifier.oph.ophLat ?? "")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("GPS Longitude:"),
                            Text(notifier.oph.ophLong ?? "")
                          ],
                        ),
                      ),
                    ],
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Jenis Pekerja:"),
                  Text(
                      "${ValueService.typeOfFormToText(notifier.oph.ophHarvestingType ?? 1)}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Apakah Panen Mekanis?"),
                  Text(
                      "${ValueService.harvestingType(notifier.oph.ophHarvestingMethod ?? 1)}")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Kemandoran:"),
                  SizedBox(
                      width: 200,
                      child: Text(
                        "${notifier.oph.mandorEmployeeCode ?? ""} ${notifier.oph.mandorEmployeeName ?? ""} ",
                        textAlign: TextAlign.end,
                      ))
                ],
              ),
            ),
            notifier.oph.ophHarvestingType == 3
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Vendor:"),
                        SizedBox(
                          width: 200,
                          child: Text(
                              "${notifier.oph.employeeCode ?? ""} ${notifier.oph.employeeName ?? ""}",
                              textAlign: TextAlign.end),
                        )
                      ],
                    ),
                  )
                : Container(),
            notifier.oph.ophHarvestingType != 3
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Pekerja:"),
                        SizedBox(
                          width: 200,
                          child: Text(
                              "${notifier.oph.employeeCode ?? ""} ${notifier.oph.employeeName ?? ""}",
                              textAlign: TextAlign.end),
                        )
                      ],
                    ),
                  )
                : Container(),
            notifier.oph.ophHarvestingType == 2
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Customer:"),
                        SizedBox(
                          width: 200,
                          child: Text(notifier.oph.ophCustomerCode ?? "",
                              textAlign: TextAlign.end),
                        )
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
                  SizedBox(
                    width: 200,
                    child: Text(notifier.oph.ophEstateCode ?? "",
                        textAlign: TextAlign.end),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Divisi:"),
                  Text(notifier.oph.ophDivisionCode ?? "",
                      textAlign: TextAlign.end)
                ],
              ),
            ),
            notifier.onEdit
                ? Padding(
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
                                textCapitalization:
                                    TextCapitalization.characters,
                                decoration: const InputDecoration(
                                    hintText: "Tulis blok"),
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
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Blok:"),
                        Text(
                          notifier.oph.ophBlockCode ?? "",
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Estimasi berat OPH (Kg):"),
                  Text(
                    "${notifier.oph.ophEstimateTonnage ?? ""}",
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("TPH"),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            notifier.oph.ophTphCode ?? "",
                            style: Style.textBold18,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 80),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Kartu OPH"),
                        notifier.onChangeCard
                            ? Column(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: TextFormField(
                                      controller: notifier.ophNumber,
                                      textAlign: TextAlign.center,
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      decoration: const InputDecoration(
                                          hintText: "Tulis Kartu OPH"),
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
                                            notifier.ophNumber =
                                                TextEditingController(
                                                    text: result);
                                          });
                                        }
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
                                            "BACA QR KARTU",
                                            textAlign: TextAlign.center,
                                            style: Style.whiteBold14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  notifier.oph.ophCardId ?? "",
                                  style: Style.textBold18,
                                ),
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.file(
              File("${notifier.oph.ophPhoto}"),
              height: 300,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Container();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            notifier.onEdit
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        notifier.getCamera(context);
                      },
                      child: Card(
                        color: Palette.greenColor,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(14),
                          child: const Text(
                            "FOTO HASIL PANEN",
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
                : Container(),
            notifier.isChangeCard
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        notifier.onChangeCardEdit();
                      },
                      child: Card(
                        color: Palette.primaryColorProd,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(14),
                          child: const Text(
                            "GANTI KARTU OPH",
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
                : Container(),
            notifier.onEdit || notifier.onChangeCard
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        notifier.onSaveChangeCard(context);
                      },
                      child: Card(
                        color: Palette.primaryColorProd,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(14),
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
                : Container(),
            !notifier.isExist
                ? Container()
                : notifier.onEdit
                    ? Container()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
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
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(14),
                              child: const Text(
                                "UBAH DATA OPH",
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
