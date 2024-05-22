import 'package:epms/base/ui/style.dart';
import 'package:epms/common_manager/bunches_formatter.dart';
import 'package:epms/screen/supervisor/supervisor_harvest_form/supervisor_harvest_form_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SupervisorFormFruit extends StatefulWidget {
  const SupervisorFormFruit({super.key});

  @override
  State<SupervisorFormFruit> createState() => _SupervisorFormFruitState();
}

class _SupervisorFormFruitState extends State<SupervisorFormFruit> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorHarvestFormNotifier>(
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
                              BunchesFormatter()
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
                              BunchesFormatter()
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
                              BunchesFormatter()
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
                              BunchesFormatter()
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
                              BunchesFormatter()
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
                              BunchesFormatter()
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
                                  "Janjang Tidak Dikirim",
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
                            BunchesFormatter()
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
                            BunchesFormatter()
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
                          controller: notifier.bunchesNotSent,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Style.textBold20,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            BunchesFormatter()
                          ],
                          decoration: const InputDecoration(hintText: "0"),
                          onChanged: (value) {
                            notifier.countBunches(
                                context, notifier.bunchesNotSent);
                          },
                        ),
                      ),
                    ]),
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
