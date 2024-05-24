import 'package:epms/base/ui/style.dart';
import 'package:epms/screen/supervisor_spb/supervisi_spb_form/supervisor_spb_form_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SupervisorSPBFormFruit extends StatefulWidget {
  const SupervisorSPBFormFruit({super.key});

  @override
  State<SupervisorSPBFormFruit> createState() => _SupervisorSPBFormFruitState();
}

class _SupervisorSPBFormFruitState extends State<SupervisorSPBFormFruit> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorSPBFormNotifier>(
        builder: (context, notifier, child) {
      return SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(children: [
              Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    const TableRow(
                      children: <Widget>[
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Masak"),
                            SizedBox(height: 6),
                          ]),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Lewat Masak"),
                            SizedBox(height: 6),
                          ]),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Mengkal"),
                            SizedBox(height: 6),
                          ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.bunchesRipe,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(hintText: "0"),
                            onChanged: (value) {
                              notifier.countBunches(
                                  context, notifier.bunchesRipe);
                            },
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.bunchesOverRipe,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(hintText: "0"),
                            onChanged: (value) {
                              notifier.countBunches(
                                  context, notifier.bunchesOverRipe);
                            },
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.bunchesHalfRipe,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(hintText: "0"),
                            onChanged: (value) {
                              notifier.countBunches(
                                  context, notifier.bunchesHalfRipe);
                            },
                          ),
                        ),
                      ],
                    ),
                    const TableRow(
                      children: <Widget>[
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Mentah"),
                            SizedBox(height: 6),
                          ]),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Tidak Normal"),
                            SizedBox(height: 6),
                          ]),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Janjang Kosong"),
                            SizedBox(height: 6),
                          ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.bunchesUnRipe,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(hintText: "0"),
                            onChanged: (value) {
                              notifier.countBunches(
                                  context, notifier.bunchesUnRipe);
                            },
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.bunchesAbnormal,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(hintText: "0"),
                            onChanged: (value) {
                              notifier.countBunches(
                                  context, notifier.bunchesAbnormal);
                            },
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.bunchesEmpty,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(hintText: "0"),
                            onChanged: (value) {
                              notifier.countBunches(
                                  context, notifier.bunchesEmpty);
                            },
                          ),
                        ),
                      ],
                    ),
                    const TableRow(
                      children: <Widget>[
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Total Janjang"),
                            SizedBox(height: 6),
                          ]),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Brondolan (Kg)"),
                            SizedBox(height: 6),
                          ]),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            SizedBox(
                                width: 100,
                                child: Text(
                                  "Total Janjang Normal",
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(height: 6),
                          ]),
                        ),
                      ],
                    ),
                    TableRow(children: <Widget>[
                      Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          enabled: false,
                          controller: notifier.bunchesTotal,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Style.textBold20,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                              hintText: "0", border: InputBorder.none),
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: notifier.looseFruits,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Style.textBold20,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(hintText: "0"),
                          onChanged: (value) {
                            notifier.countBunches(
                                context, notifier.looseFruits);
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          enabled: false,
                          controller: notifier.bunchesNormalTotal,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Style.textBold20,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: const InputDecoration(
                              hintText: "0", border: InputBorder.none),
                          onChanged: (value) {
                            notifier.countBunches(
                                context, notifier.bunchesNormalTotal);
                          },
                        ),
                      ),
                    ]),
                  ]),
              const SizedBox(height: 30),
              Text("KUALITAS JANJANG", style: Style.textBold16),
              const SizedBox(height: 20),
              Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    const TableRow(
                      children: <Widget>[
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Janjang tangkai panjang",
                                textAlign: TextAlign.center),
                            SizedBox(height: 6),
                          ]),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Catatan janjang tangkai panjang",
                                textAlign: TextAlign.center),
                            SizedBox(height: 6),
                          ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.janjangTangkaiPanjang,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(hintText: "0"),
                            onChanged: (value) {
                              notifier.countBunches(
                                  context, notifier.janjangTangkaiPanjang);
                            },
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.noteJanjangTangkaiPanjang,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration:
                                const InputDecoration(hintText: "Catatan"),
                          ),
                        ),
                      ],
                    ),
                  ]),
              const SizedBox(height: 30),
              Text("KUALITAS BRONDOLAN", style: Style.textBold16),
              const SizedBox(height: 20),
              Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    const TableRow(
                      children: <Widget>[
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Sampah"),
                            SizedBox(height: 6),
                          ]),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text("Batu"),
                            SizedBox(height: 6),
                          ]),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.sampah,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(hintText: "0"),
                            onChanged: (value) {
                              notifier.countBunches(context, notifier.sampah);
                            },
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: notifier.batu,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            decoration: const InputDecoration(hintText: "0"),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            onChanged: (value) {
                              notifier.countBunches(context, notifier.batu);
                            },
                          ),
                        ),
                      ],
                    ),
                  ]),
              const SizedBox(height: 30),
              Column(
                children: [
                  const Text("Catatan"),
                  TextFormField(
                    controller: notifier.notesOPH,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: "Catatan"),
                    keyboardType: TextInputType.multiline,
                    maxLength: 50,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                ],
              ),
            ]),
          ),
        ),
      );
    });
  }
}
