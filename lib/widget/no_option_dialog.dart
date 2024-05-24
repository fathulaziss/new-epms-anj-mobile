import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:flutter/material.dart';

class NoOptionDialog extends StatefulWidget {
  const NoOptionDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.onPress,
  });

  final String title, subtitle, buttonText;
  final Function()? onPress;

  @override
  State<NoOptionDialog> createState() => _NoOptionDialogState();
}

class _NoOptionDialogState extends State<NoOptionDialog> {
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
        title: Text(widget.title, textAlign: TextAlign.center),
        content: Text(widget.subtitle, textAlign: TextAlign.center),
        actions: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: widget.onPress,
              child: Card(
                color: Palette.primaryColorProd,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    widget.buttonText,
                    style: Style.whiteBold18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
