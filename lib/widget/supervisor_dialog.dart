import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/model/supervisor.dart';
import 'package:flutter/material.dart';

class SupervisorDialog extends StatefulWidget {
  const SupervisorDialog({super.key, required this.supervisor, this.onPress});

  final Supervisor supervisor;
  final Function()? onPress;

  @override
  State<SupervisorDialog> createState() => _SupervisorDialogState();
}

class _SupervisorDialogState extends State<SupervisorDialog> {
  @override
  Widget build(BuildContext context) {
    return dialogContent(context);
  }

  Widget dialogContent(BuildContext context) {
    return MediaQuery(
      data: Style.mediaQueryText(context),
      child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          title: const Center(child: Text("Supervisi Kemandoran")),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Mandor:"),
                  Text(
                    "${widget.supervisor.mandorCode}",
                    style: Style.textBold14,
                  ),
                  Text(
                    "${widget.supervisor.mandorName}",
                    style: Style.textBold14,
                  ),
                  const Divider(),
                  const Text("Mandor 1:"),
                  Text("${widget.supervisor.mandor1Code}",
                      style: Style.textBold14),
                  Text("${widget.supervisor.mandor1Name}",
                      style: Style.textBold14),
                  const Divider(),
                  const Text("Kerani Panen:"),
                  Text("${widget.supervisor.keraniPanenCode}",
                      style: Style.textBold14),
                  Text("${widget.supervisor.keraniPanenName}",
                      style: Style.textBold14),
                  const Divider(),
                  const Text("Kerani Kirim"),
                  Text("${widget.supervisor.keraniKirimCode}",
                      style: Style.textBold14),
                  Text("${widget.supervisor.keraniKirimName}",
                      style: Style.textBold14),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: widget.onPress,
                    child: Card(
                      color: Palette.primaryColorProd,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(14),
                        child: Text("OK",
                            style: Style.whiteBold18,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ))
          ]),
    );
  }
}
