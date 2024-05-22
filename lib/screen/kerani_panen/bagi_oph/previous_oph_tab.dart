import 'dart:io';

import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/value_service.dart';
import 'package:epms/screen/kerani_panen/bagi_oph/bagi_oph_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreviousOPHTab extends StatefulWidget {
  const PreviousOPHTab({super.key});

  @override
  State<PreviousOPHTab> createState() => _PreviousOPHTabState();
}

class _PreviousOPHTabState extends State<PreviousOPHTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BagiOPHNotifier>(builder: (context, bagiOPH, child) {
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
                    bagiOPH.oph.ophId ?? "",
                    style: Style.textBold20,
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
                    const Text("Tanggal:"),
                    Expanded(
                      child: Text(
                        "${bagiOPH.oph.createdDate ?? ""} ${bagiOPH.oph.createdTime ?? ""}",
                        textAlign: TextAlign.end,
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Jenis Pekerja:"),
                    Expanded(
                      child: Text(
                        "${ValueService.typeOfFormToText(bagiOPH.oph.ophHarvestingType ?? 1)}",
                        textAlign: TextAlign.end,
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Apakah Panen Mekanis?"),
                    Expanded(
                      child: Text(
                        "${ValueService.harvestingType(bagiOPH.oph.ophHarvestingMethod ?? 1)}",
                        textAlign: TextAlign.end,
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Kemandoran:"),
                    Expanded(
                      child: SizedBox(
                        width: 200,
                        child: Text(
                            "${bagiOPH.oph.mandorEmployeeCode ?? ""}  ${bagiOPH.oph.mandorEmployeeName ?? ""}",
                            textAlign: TextAlign.end),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Pekerja:"),
                    Expanded(
                      child: SizedBox(
                          width: 200,
                          child: Text(
                              "${bagiOPH.oph.employeeCode ?? ""}  ${bagiOPH.oph.employeeName ?? ""}",
                              textAlign: TextAlign.end)),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Customer:"),
                    Expanded(
                      child: SizedBox(
                        width: 200,
                        child: Text(bagiOPH.oph.ophCustomerCode ?? "",
                            textAlign: TextAlign.end),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Estate:"),
                    Expanded(
                      child: SizedBox(
                        width: 200,
                        child: Text(bagiOPH.oph.ophEstateCode ?? "",
                            textAlign: TextAlign.end),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Divisi:"),
                    Expanded(
                      child: SizedBox(
                        width: 200,
                        child: Text(
                            "${bagiOPH.oph.ophDivisionCode == null || bagiOPH.oph.ophDivisionCode == "null" ? "" : bagiOPH.oph.ophDivisionCode}",
                            textAlign: TextAlign.end),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Blok:"),
                    Expanded(
                      child: SizedBox(
                        width: 200,
                        child: Text(bagiOPH.oph.ophBlockCode ?? "",
                            textAlign: TextAlign.end),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Estimasi berat OPH (Kg):"),
                    Expanded(
                      child: SizedBox(
                        width: 200,
                        child: Text("${bagiOPH.oph.ophEstimateTonnage ?? 0}",
                            textAlign: TextAlign.end),
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("TPH"),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            bagiOPH.oph.ophTphCode ?? "",
                            style: Style.textBold20,
                          ),
                        )
                      ]),
                ),
                const SizedBox(width: 80),
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Kartu OPH"),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(bagiOPH.oph.ophCardId ?? "",
                              style: Style.textBold20),
                        )
                      ]),
                )
              ]),
            ),
            const Divider(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        const TableRow(children: <Widget>[
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("Masak"),
                              SizedBox(height: 8),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("Lewat Masak"),
                              SizedBox(height: 8),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("Mengkal"),
                              SizedBox(height: 8),
                            ]),
                          ),
                        ]),
                        TableRow(children: <Widget>[
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text(
                                "${bagiOPH.bunchesRipePrev}",
                                style: Style.textBold20,
                              ),
                              const SizedBox(height: 20),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text(
                                "${bagiOPH.bunchesOverRipePrev}",
                                style: Style.textBold20,
                              ),
                              const SizedBox(height: 20),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text(
                                "${bagiOPH.bunchesHalfRipePrev}",
                                style: Style.textBold20,
                              ),
                              const SizedBox(height: 20),
                            ]),
                          ),
                        ]),
                        const TableRow(children: <Widget>[
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("Mentah"),
                              SizedBox(height: 8),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("Tidak Normal"),
                              SizedBox(height: 8),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("Janjang Kosong"),
                              SizedBox(height: 8),
                            ]),
                          ),
                        ]),
                        TableRow(children: <Widget>[
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("${bagiOPH.bunchesUnRipePrev}",
                                  style: Style.textBold20),
                              const SizedBox(height: 20),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("${bagiOPH.bunchesAbnormalPrev}",
                                  style: Style.textBold20),
                              const SizedBox(height: 20),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("${bagiOPH.bunchesEmptyPrev}",
                                  style: Style.textBold20),
                              const SizedBox(height: 20),
                            ]),
                          ),
                        ]),
                        const TableRow(children: <Widget>[
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("Total Janjang"),
                              SizedBox(height: 8),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("Brondolan (Kg)"),
                              SizedBox(height: 8),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Janjang Tidak Dikirim",
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(height: 8),
                            ]),
                          ),
                        ]),
                        TableRow(children: <Widget>[
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("${bagiOPH.bunchesTotalPrev}",
                                  style: Style.textBold20),
                              const SizedBox(height: 20),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("${bagiOPH.looseFruitsPrev}",
                                  style: Style.textBold20),
                              const SizedBox(height: 20),
                            ]),
                          ),
                          SizedBox(
                            width: 110,
                            child: Column(children: [
                              Text("${bagiOPH.bunchesNotSentPrev}",
                                  style: Style.textBold20),
                              const SizedBox(height: 20),
                            ]),
                          ),
                        ]),
                      ]),
                  const SizedBox(height: 20),
                  Column(children: [
                    const Text("Catatan"),
                    const SizedBox(height: 8),
                    Text(bagiOPH.oph.ophNotes ?? "")
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.file(
                    File("${bagiOPH.oph.ophPhoto}"),
                    height: 300,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Container();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        bagiOPH.getCameraOldOPH(context);
                      },
                      child: Card(
                        color: Colors.green,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(14),
                          child: const Text(
                            "AMBIL FOTO",
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        bagiOPH.showDialogQuestionOld();
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
                            "SIMPAN OPH LAMA",
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
            ),
          ]),
        ),
      );
    });
  }
}
