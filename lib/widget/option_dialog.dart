import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:flutter/material.dart';

class OptionDialog extends StatefulWidget {
  const OptionDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonTextYes,
    required this.buttonTextNo,
    this.onPressYes,
    this.onPressNo,
  });

  final String title, subtitle, buttonTextYes, buttonTextNo;
  final Function()? onPressYes;
  final Function()? onPressNo;

  @override
  State<OptionDialog> createState() => _OptionDialogState();
}

class _OptionDialogState extends State<OptionDialog> {
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
        title: Center(
          child: Text(widget.title, textAlign: TextAlign.center),
        ),
        content: Text(widget.subtitle, textAlign: TextAlign.center),
        actions: <Widget>[
          Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: widget.onPressYes,
                  child: Card(
                    color: Palette.primaryColorProd,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(14),
                      child: Text(widget.buttonTextYes,
                          style: Style.whiteBold18,
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: InkWell(
                  onTap: widget.onPressNo,
                  child: Card(
                    color: Palette.redColorLight,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(14),
                      child: Text(widget.buttonTextNo,
                          style: Style.whiteBold18,
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
