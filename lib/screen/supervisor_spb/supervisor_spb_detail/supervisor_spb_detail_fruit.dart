import 'package:epms/base/ui/style.dart';
import 'package:epms/screen/supervisor_spb/supervisor_spb_detail/supervisor_spb_detail_notifier.dart';
import 'package:epms/widget/expansion_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorSPBDetailFruit extends StatefulWidget {
  const SupervisorSPBDetailFruit({super.key});

  @override
  State<SupervisorSPBDetailFruit> createState() =>
      _SupervisorSPBDetailFruitState();
}

class _SupervisorSPBDetailFruitState extends State<SupervisorSPBDetailFruit> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SupervisorSPBDetailNotifier>(
        builder: (context, notifier, child) {
      return SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                ExpansionCustom(
                  title: "Masak",
                  subtitle:
                      "Total Masak : ${(notifier.spbSupervise.bunchesRipe ?? 0) + (notifier.spbSupervise.ripeAbnormalTotal ?? 0)}",
                  initiallyExpanded: true,
                  enabled: false,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.bunchesRipe}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Abnormal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.ripeAbnormalTotal}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text('Partenocarpi')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.ripeParteno}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.ripeBroken}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.ripeRat}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.ripeRotten}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.ripeOther}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                const SizedBox(height: 12),
                ExpansionCustom(
                  title: "Lewat Masak",
                  subtitle:
                      "Total Lewat Masak : ${(notifier.spbSupervise.bunchesOverripe ?? 0) + (notifier.spbSupervise.overripeAbnormalTotal ?? 0)}",
                  initiallyExpanded: true,
                  enabled: false,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.bunchesOverripe}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Abnormal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.overripeAbnormalTotal}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text('Partenocarpi')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.overripeParteno}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.overripeBroken}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.overripeRat}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.overripeRotten}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.overripeOther}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                const SizedBox(height: 12),
                ExpansionCustom(
                  title: "Mengkal",
                  subtitle:
                      "Total Mengkal : ${(notifier.spbSupervise.bunchesHalfripe ?? 0) + (notifier.spbSupervise.halfripeAbnormalTotal ?? 0)}",
                  initiallyExpanded: true,
                  enabled: false,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.bunchesHalfripe}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Abnormal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.halfripeAbnormalTotal}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text('Partenocarpi')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.halfripeParteno}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.halfripeBroken}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.halfripeRat}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.halfripeRotten}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.halfripeOther}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                const SizedBox(height: 12),
                ExpansionCustom(
                  title: "Mentah",
                  subtitle:
                      "Total Mentah : ${(notifier.spbSupervise.bunchesUnripe ?? 0) + (notifier.spbSupervise.unripeAbnormalTotal ?? 0)}",
                  initiallyExpanded: true,
                  enabled: false,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.bunchesUnripe}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Abnormal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.unripeAbnormalTotal}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text('Partenocarpi')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.unripeParteno}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.unripeBroken}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.unripeRat}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.unripeRotten}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.unripeOther}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                const SizedBox(height: 12),
                ExpansionCustom(
                  title: "Janjang Kosong",
                  subtitle:
                      "Total Janjang Kosong : ${(notifier.spbSupervise.bunchesEmpty ?? 0) + (notifier.spbSupervise.emptyAbnormalTotal ?? 0)}",
                  initiallyExpanded: true,
                  enabled: false,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.bunchesEmpty}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Abnormal')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.emptyAbnormalTotal}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text('Partenocarpi')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.emptyParteno}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.emptyBroken}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.emptyRat}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.emptyRotten}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.emptyOther}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    const TableRow(
                      children: <Widget>[
                        SizedBox(
                          width: 110,
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              Text("Total Janjang"),
                              SizedBox(height: 6),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              Text("Brondolan (Kg)"),
                              SizedBox(height: 6),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              SizedBox(
                                width: 100,
                                child: Text("Total Janjang Normal",
                                    textAlign: TextAlign.center),
                              ),
                              SizedBox(height: 6),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.bunchesTotal}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.looseFruits}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.bunchesTotalNormal}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text("KUALITAS JANJANG", style: Style.textBold16),
                const SizedBox(height: 20),
                Table(
                  children: [
                    const TableRow(
                      children: <Widget>[
                        SizedBox(
                          width: 110,
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text(
                              "Total Janjang Tidak Normal",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 6),
                          ]),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              Text(
                                "Janjang Tangkai Panjang",
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 6),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Catatan Janjang Tangkai Panjang",
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(height: 6),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.bunchesAbnormal}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.bunchesTangkaiPanjang}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Text(
                                "${notifier.spbSupervise.catatanBunchesTangkaiPanjang}",
                                style: Style.textBold18,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                            child: Column(
                              children: [
                                Text(
                                  "${notifier.spbSupervise.bunchesSampah}",
                                  style: Style.textBold18,
                                  textAlign: TextAlign.center,
                                ),
                                const Divider(),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Text(
                                  "${notifier.spbSupervise.bunchesBatu}",
                                  style: Style.textBold18,
                                  textAlign: TextAlign.center,
                                ),
                                const Divider(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                const SizedBox(height: 30),
                Column(
                  children: [
                    const Text("Catatan"),
                    Text(
                      "${notifier.spbSupervise.supervisiNotes}",
                      style: Style.textBold18,
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                  ],
                ),
                // Table(
                //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                //     children: <TableRow>[
                //       const TableRow(
                //         children: <Widget>[
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Masak"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Lewat Masak"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Mengkal"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //         ],
                //       ),
                //       TableRow(
                //         children: <Widget>[
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.bunchesRipe}",
                //                 style: Style.textBold18,
                //                 textAlign: TextAlign.center,
                //               )),
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.bunchesOverripe}",
                //                 style: Style.textBold18,
                //                 textAlign: TextAlign.center,
                //               )),
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.bunchesHalfripe}",
                //                 style: Style.textBold18,
                //                 textAlign: TextAlign.center,
                //               )),
                //         ],
                //       ),
                //       const TableRow(
                //         children: <Widget>[
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Mentah"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Tidak Normal"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Janjang Kosong"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //         ],
                //       ),
                //       TableRow(
                //         children: <Widget>[
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.bunchesUnripe}",
                //                 style: Style.textBold18,
                //                 textAlign: TextAlign.center,
                //               )),
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.bunchesAbnormal}",
                //                 style: Style.textBold18,
                //                 textAlign: TextAlign.center,
                //               )),
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.bunchesEmpty}",
                //                 style: Style.textBold18,
                //                 textAlign: TextAlign.center,
                //               )),
                //         ],
                //       ),
                //       const TableRow(
                //         children: <Widget>[
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Total Janjang"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Brondolan (Kg)"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               SizedBox(
                //                   width: 100,
                //                   child: Text(
                //                     "Total Janjang Normal",
                //                     textAlign: TextAlign.center,
                //                   )),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //         ],
                //       ),
                //       TableRow(children: <Widget>[
                //         Container(
                //             width: 100,
                //             padding: const EdgeInsets.symmetric(horizontal: 16),
                //             child: Text(
                //               "${notifier.spbSupervise.bunchesTotal}",
                //               style: Style.textBold18,
                //               textAlign: TextAlign.center,
                //             )),
                //         Container(
                //             width: 100,
                //             padding: const EdgeInsets.symmetric(horizontal: 16),
                //             child: Text(
                //               "${notifier.spbSupervise.looseFruits}",
                //               style: Style.textBold18,
                //               textAlign: TextAlign.center,
                //             )),
                //         Container(
                //             width: 100,
                //             padding: const EdgeInsets.symmetric(horizontal: 16),
                //             child: Text(
                //               "${notifier.spbSupervise.bunchesTotalNormal}",
                //               style: Style.textBold18,
                //               textAlign: TextAlign.center,
                //             )),
                //       ]),
                //     ]),
                // const SizedBox(height: 30),
                // Text("KUALITAS JANJANG", style: Style.textBold16),
                // const SizedBox(height: 20),
                // Table(
                //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                //     children: <TableRow>[
                //       const TableRow(
                //         children: <Widget>[
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Janjang tangkai panjang",
                //                   textAlign: TextAlign.center),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Catatan janjang tangkai panjang",
                //                   textAlign: TextAlign.center),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //         ],
                //       ),
                //       TableRow(
                //         children: <Widget>[
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.bunchesTangkaiPanjang}",
                //                 style: Style.textBold18,
                //                 textAlign: TextAlign.center,
                //               )),
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.catatanBunchesTangkaiPanjang}",
                //                 textAlign: TextAlign.center,
                //               )),
                //         ],
                //       ),
                //     ]),
                // const SizedBox(height: 30),
                // Text("KUALITAS BRONDOLAN", style: Style.textBold16),
                // const SizedBox(height: 20),
                // Table(
                //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                //     children: <TableRow>[
                //       const TableRow(
                //         children: <Widget>[
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Sampah"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //           SizedBox(
                //             width: 110,
                //             child: Column(children: [
                //               SizedBox(height: 12),
                //               Text("Batu"),
                //               SizedBox(height: 6),
                //             ]),
                //           ),
                //         ],
                //       ),
                //       TableRow(
                //         children: <Widget>[
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.bunchesSampah}",
                //                 style: Style.textBold18,
                //                 textAlign: TextAlign.center,
                //               )),
                //           Container(
                //               width: 100,
                //               padding: const EdgeInsets.symmetric(horizontal: 16),
                //               child: Text(
                //                 "${notifier.spbSupervise.bunchesBatu}",
                //                 style: Style.textBold18,
                //                 textAlign: TextAlign.center,
                //               )),
                //         ],
                //       ),
                //     ]),
                // const SizedBox(height: 30),
                // Column(
                //   children: [
                //     const Text("Catatan"),
                //     Text(
                //       "${notifier.spbSupervise.supervisiNotes}",
                //       textAlign: TextAlign.center,
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
