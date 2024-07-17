import 'package:epms/base/ui/style.dart';
import 'package:epms/screen/supervisor_spb/supervisi_spb_form/supervisor_spb_form_notifier.dart';
import 'package:epms/widget/expansion_custom.dart';
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
            child: Column(
              children: [
                ExpansionCustom(
                  title: "Masak",
                  subtitle:
                      "Total Masak : ${int.parse(notifier.masakNormal.text.isNotEmpty ? notifier.masakNormal.text : "0") + int.parse(notifier.masakAbnormal.text.isNotEmpty ? notifier.masakAbnormal.text : "0")}",
                  initiallyExpanded: true,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.masakNormal,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countTotalJanjangNormal(
                                  context, notifier.masakNormal);
                            },
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
                              TextFormField(
                                enabled: false,
                                controller: notifier.masakAbnormal,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: Style.textBold20,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: const InputDecoration(
                                  hintText: "0",
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
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
                          child: TextFormField(
                            controller: notifier.masakParteno,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMasakAbnormal(
                                  context, notifier.masakParteno);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.masakPatah,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMasakAbnormal(
                                  context, notifier.masakPatah);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.masakDimakanTikus,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMasakAbnormal(
                                  context, notifier.masakDimakanTikus);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.masakBusuk,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMasakAbnormal(
                                  context, notifier.masakBusuk);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.masakOther,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMasakAbnormal(
                                  context, notifier.masakOther);
                            },
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
                      "Total Lewat Masak : ${int.parse(notifier.lewatMasakNormal.text.isNotEmpty ? notifier.lewatMasakNormal.text : "0") + int.parse(notifier.lewatMasakAbnormal.text.isNotEmpty ? notifier.lewatMasakAbnormal.text : "0")}",
                  initiallyExpanded: false,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.lewatMasakNormal,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countTotalJanjangNormal(
                                  context, notifier.lewatMasakNormal);
                            },
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
                              TextFormField(
                                enabled: false,
                                controller: notifier.lewatMasakAbnormal,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: Style.textBold20,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: const InputDecoration(
                                  hintText: "0",
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                              const Divider()
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(child: Text('Partenocarpi')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.lewatMasakParteno,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahLewatMasakAbnormal(
                                  context, notifier.lewatMasakParteno);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.lewatMasakPatah,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahLewatMasakAbnormal(
                                  context, notifier.lewatMasakPatah);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.lewatMasakDimakanTikus,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahLewatMasakAbnormal(
                                  context, notifier.lewatMasakDimakanTikus);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.lewatMasakBusuk,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahLewatMasakAbnormal(
                                  context, notifier.lewatMasakBusuk);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.lewatMasakOther,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahLewatMasakAbnormal(
                                  context, notifier.lewatMasakOther);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24)
                  ],
                ),
                const SizedBox(height: 12),
                ExpansionCustom(
                  title: "Mengkal",
                  subtitle:
                      "Total Mengkal : ${int.parse(notifier.mengkalNormal.text.isNotEmpty ? notifier.mengkalNormal.text : "0") + int.parse(notifier.mengkalAbnormal.text.isNotEmpty ? notifier.mengkalAbnormal.text : "0")}",
                  initiallyExpanded: false,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mengkalNormal,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countTotalJanjangNormal(
                                  context, notifier.mengkalNormal);
                            },
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
                              TextFormField(
                                enabled: false,
                                controller: notifier.mengkalAbnormal,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: Style.textBold20,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: const InputDecoration(
                                  hintText: "0",
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
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
                          child: TextFormField(
                            controller: notifier.mengkalParteno,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMengkalAbnormal(
                                  context, notifier.mengkalParteno);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mengkalPatah,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMengkalAbnormal(
                                  context, notifier.mengkalPatah);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mengkalDimakanTikus,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMengkalAbnormal(
                                  context, notifier.mengkalDimakanTikus);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mengkalBusuk,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMengkalAbnormal(
                                  context, notifier.mengkalBusuk);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mengkalOther,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMengkalAbnormal(
                                  context, notifier.mengkalOther);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24)
                  ],
                ),
                const SizedBox(height: 12),
                ExpansionCustom(
                  title: "Mentah",
                  subtitle:
                      "Total Mentah : ${int.parse(notifier.mentahNormal.text.isNotEmpty ? notifier.mentahNormal.text : "0") + int.parse(notifier.mentahAbnormal.text.isNotEmpty ? notifier.mentahAbnormal.text : "0")}",
                  initiallyExpanded: false,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mentahNormal,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countTotalJanjangNormal(
                                  context, notifier.mentahNormal);
                            },
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
                              TextFormField(
                                enabled: false,
                                controller: notifier.mentahAbnormal,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: Style.textBold20,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: const InputDecoration(
                                  hintText: "0",
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
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
                          child: TextFormField(
                            controller: notifier.mentahParteno,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMentahAbnormal(
                                  context, notifier.mentahParteno);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mentahPatah,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMentahAbnormal(
                                  context, notifier.mentahPatah);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mentahDimakanTikus,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMentahAbnormal(
                                  context, notifier.mentahDimakanTikus);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mentahBusuk,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMentahAbnormal(
                                  context, notifier.mentahBusuk);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.mentahOther,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahMentahAbnormal(
                                  context, notifier.mentahOther);
                            },
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
                      "Total Janjang Kosong : ${int.parse(notifier.jangkosNormal.text.isNotEmpty ? notifier.jangkosNormal.text : "0") + int.parse(notifier.jangkosAbnormal.text.isNotEmpty ? notifier.jangkosAbnormal.text : "0")}",
                  initiallyExpanded: false,
                  children: [
                    Row(
                      children: [
                        const Expanded(child: Text('Normal')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.jangkosNormal,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countTotalJanjangNormal(
                                  context, notifier.jangkosNormal);
                            },
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
                              TextFormField(
                                enabled: false,
                                controller: notifier.jangkosAbnormal,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: Style.textBold20,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: const InputDecoration(
                                  hintText: "0",
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
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
                          child: TextFormField(
                            controller: notifier.jangkosParteno,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahJangkosAbnormal(
                                  context, notifier.jangkosParteno);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Patah')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.jangkosPatah,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahJangkosAbnormal(
                                  context, notifier.jangkosPatah);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Dimakan Tikus')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.jangkosDimakanTikus,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahJangkosAbnormal(
                                  context, notifier.jangkosDimakanTikus);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Buah Busuk')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.jangkosBusuk,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahJangkosAbnormal(
                                  context, notifier.jangkosBusuk);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(child: Text('Dsb')),
                        Expanded(
                          child: TextFormField(
                            controller: notifier.jangkosOther,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              hintText: "0",
                              isDense: true,
                            ),
                            onChanged: (value) {
                              notifier.countBuahJangkosAbnormal(
                                  context, notifier.jangkosOther);
                            },
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
                    TableRow(
                      children: <Widget>[
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
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
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
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(hintText: "0"),
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
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                                hintText: "0", border: InputBorder.none),
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
                          child: Column(children: [
                            SizedBox(height: 12),
                            Text(
                              "Janjang Tangkai Panjang",
                              textAlign: TextAlign.center,
                            ),
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
                                  "Catatan Janjang Tangkai Panjang",
                                  textAlign: TextAlign.center,
                                )),
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
                            enabled: false,
                            controller: notifier.bunchesUnNormalTotal,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Style.textBold20,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                                hintText: "0", border: InputBorder.none),
                          ),
                        ),
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
