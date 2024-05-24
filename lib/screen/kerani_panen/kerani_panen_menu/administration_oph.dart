import 'package:epms/base/common/locator.dart';
import 'package:epms/base/common/routes.dart';
import 'package:epms/base/constants/image_assets.dart';
import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/base/ui/theme_notifier.dart';
import 'package:epms/common_manager/dialog_services.dart';
import 'package:epms/common_manager/navigator_service.dart';
import 'package:epms/model/menu_entities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdministrationOPHScreen extends StatefulWidget {
  const AdministrationOPHScreen({super.key});

  @override
  State<AdministrationOPHScreen> createState() =>
      _AdministrationOPHScreenState();
}

class _AdministrationOPHScreenState extends State<AdministrationOPHScreen> {
  final NavigatorService _navigationService = locator<NavigatorService>();

  NavigatorService get navigationService => _navigationService;

  final DialogService _dialogService = locator<DialogService>();

  DialogService get dialogService => _dialogService;

  onClickMenu(int index) {
    switch (administrationOPHMenuEntries[index - 2].toUpperCase()) {
      case "UBAH DATA OPH":
        _navigationService.push(Routes.OPH_HISTORY_PAGE, arguments: 'UBAH');
        break;
      case "GANTI OPH HILANG":
        _navigationService.push(Routes.OPH_HISTORY_PAGE, arguments: 'GANTI');
        break;
      case "BAGI OPH":
        _navigationService.push(Routes.BAGI_OPH);
        break;
      case "KEMBALI":
        _navigationService.pop();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: Style.mediaQueryText(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Consumer<ThemeNotifier>(
                builder: (context, theme, child) => Flexible(
                      child: Switch(
                          activeColor: Palette.greenColor,
                          value: theme.status ?? true,
                          onChanged: (value) {
                            value ? theme.setDarkMode() : theme.setLightMode();
                          }),
                    ))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: administrationOPHMenuEntries.length + 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: index == 0
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Image.asset(
                                  ImageAssets.ANJ_LOGO,
                                  height: 60,
                                ),
                              )
                            : index == 1
                                ? Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ImageAssets.KERANI_PANEN,
                                          color: Palette.primaryColorProd,
                                          height: 45,
                                        ),
                                        Text(
                                          "  KERANI PANEN",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.primaryColorProd,
                                              fontSize: 18),
                                        )
                                      ],
                                    ))
                                : index ==
                                        administrationOPHMenuEntries.length + 2
                                    ? Container(
                                        padding: const EdgeInsets.only(top: 16),
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Divider(),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    ImageAssets.ANJ_LOGO,
                                                    height: 25,
                                                  ),
                                                ),
                                                const Text("ePMS ANJ Group")
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    : TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              colorCodesAdministrationOPH[
                                                  index - 2],
                                          minimumSize: Size(
                                              MediaQuery.of(context).size.width,
                                              50),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              side: BorderSide(
                                                  color:
                                                      colorCodesAdministrationOPH[
                                                          index - 2])),
                                          padding: const EdgeInsets.all(16.0),
                                          textStyle: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        onPressed: () {
                                          onClickMenu(index);
                                        },
                                        child: Text(
                                            administrationOPHMenuEntries[
                                                    index - 2]
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
