import 'package:epms/base/constants/image_assets.dart';
import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/base/ui/theme_notifier.dart';
import 'package:epms/common_manager/storage_manager.dart';
import 'package:epms/screen/home/home_notifier.dart';
import 'package:epms/screen/supervisor_spb/supervisor_spb_menu/supervisor_spb_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupervisorSPBScreen extends StatefulWidget {
  const SupervisorSPBScreen({super.key});

  @override
  State<SupervisorSPBScreen> createState() => _SupervisorSPBScreenState();
}

class _SupervisorSPBScreenState extends State<SupervisorSPBScreen> {
  int countInspection = 2;
  bool isShowMenuInspection = false;

  @override
  void initState() {
    context.read<HomeNotifier>().getUser(context);
    getMenuInspection();
    super.initState();
  }

  getMenuInspection() async {
    final isLoginInspectionSuccess =
        await StorageManager.readData('is_login_inspection_success');

    setState(() {
      isShowMenuInspection = isLoginInspectionSuccess;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, homeNotifier, child) {
      return Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MediaQuery(
            data: Style.mediaQueryText(context),
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                surfaceTintColor: themeNotifier.status == true ||
                        MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                    ? Colors.transparent
                    : Colors.white10,
                backgroundColor: themeNotifier.status == true ||
                        MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                    ? Colors.transparent
                    : Colors.white10,
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
                    ),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Image.asset(ImageAssets.ANJ_LOGO, height: 60),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageAssets.SUPERVISI_SPB,
                                color: Palette.primaryColorProd,
                                height: 45,
                              ),
                              Text(
                                " SUPERVISI SPB",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Palette.primaryColorProd,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Palette.primaryColorProd,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Palette.primaryColorProd)),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              SupervisorSPBNotifier()
                                  .onClickMenu(context, 'SUPERVISI SPB');
                            },
                            child: const Text("SUPERVISI SPB",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Palette.primaryColorProd,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Palette.primaryColorProd)),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              SupervisorSPBNotifier().onClickMenu(
                                  context, 'HISTORY GRADING TBS LUAR');
                            },
                            child: const Text("HISTORY GRADING TBS LUAR",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Palette.primaryColorProd,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Palette.primaryColorProd)),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              SupervisorSPBNotifier().onClickMenu(
                                  context, 'HISTORY SUPERVISI SPB');
                            },
                            child: const Text("HISTORY SUPERVISI SPB",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Palette.primaryColorProd,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Palette.primaryColorProd)),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              SupervisorSPBNotifier()
                                  .onClickMenu(context, 'BACA KARTU SPB');
                            },
                            child: const Text("BACA KARTU SPB",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Palette.primaryColorProd,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Palette.primaryColorProd)),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              SupervisorSPBNotifier()
                                  .onClickMenu(context, 'BACA KARTU TBS LUAR');
                            },
                            child: const Text("BACA KARTU TBS LUAR",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        if (isShowMenuInspection)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Palette.primaryColorProd,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color: Palette.primaryColorProd)),
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                onPressed: () {
                                  SupervisorSPBNotifier()
                                      .onClickMenu(context, 'INSPECTION');
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("INSPECTION",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(width: 10),
                                      homeNotifier.countInspection == 0
                                          ? const SizedBox()
                                          : Row(children: [
                                              const Icon(Icons.warning,
                                                  color: Colors.yellow),
                                              const SizedBox(width: 10),
                                              Text(
                                                  "${homeNotifier.countInspection}",
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ])
                                    ])),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: const BorderSide(color: Colors.green)),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              SupervisorSPBNotifier()
                                  .onClickMenu(context, 'UPLOAD DATA');
                            },
                            child: const Text("UPLOAD DATA",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Palette.redColorLight,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side:
                                      BorderSide(color: Palette.redColorLight)),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              SupervisorSPBNotifier()
                                  .onClickMenu(context, 'KELUAR');
                            },
                            child: const Text("KELUAR",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Column(
                            children: [
                              Text("${homeNotifier.configSchema.employeeCode}",
                                  style: Style.textBold14),
                              Text("${homeNotifier.configSchema.employeeName}",
                                  style: Style.textBold14),
                              const SizedBox(height: 30),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: const Text("Sync Ulang"),
                                    onTap: () {
                                      SupervisorSPBNotifier().reSynch();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: const Text("Export Json"),
                                    onTap: () {
                                      SupervisorSPBNotifier()
                                          .exportJson(context);
                                    },
                                  ),
                                ),
                              ),
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  ImageAssets.ANJ_LOGO,
                                  height: 25,
                                ),
                              ),
                              const Text("ePMS ANJ Group")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
