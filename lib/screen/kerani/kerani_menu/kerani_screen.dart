import 'package:epms/base/constants/image_assets.dart';
import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/base/ui/theme_notifier.dart';
import 'package:epms/common_manager/storage_manager.dart';
import 'package:epms/database/service/database_laporan_restan.dart';
import 'package:epms/database/service/database_supervisor.dart';
import 'package:epms/model/laporan_restan.dart';
import 'package:epms/model/supervisor.dart';
import 'package:epms/screen/home/home_notifier.dart';
import 'package:epms/screen/kerani/kerani_menu/kerani_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeraniScreen extends StatefulWidget {
  const KeraniScreen({super.key});

  @override
  State<KeraniScreen> createState() => _KeraniScreenState();
}

class _KeraniScreenState extends State<KeraniScreen> {
  Supervisor? supervisor;
  int countRestan = 0;
  bool isShowMenuInspection = false;

  @override
  void initState() {
    context.read<HomeNotifier>().getUser(context);
    getSupervisor();
    super.initState();
  }

  getSupervisor() async {
    final isLoginInspectionSuccess =
        await StorageManager.readData('is_login_inspection_success');
    Supervisor? supervisor = await DatabaseSupervisor().selectSupervisor();
    List<LaporanRestan> count =
        await DatabaseLaporanRestan().selectLaporanRestan();
    setState(() {
      countRestan = count.length;
      supervisor = supervisor;
      isShowMenuInspection = isLoginInspectionSuccess;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, homeNotifier, child) {
        return Consumer<ThemeNotifier>(
          builder: (context, themeNotifier, child) {
            return Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  child: Icon(Icons.account_box_rounded,
                      color: Palette.primaryColorProd),
                  onTap: () {
                    KeraniNotifier().navigateToSupervisionForm();
                  },
                ),
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
                automaticallyImplyLeading: false,
                elevation: 0,
                actions: [
                  Consumer<ThemeNotifier>(
                      builder: (context, theme, child) => Flexible(
                            child: Switch(
                                activeColor: Palette.greenColor,
                                value: theme.status ?? true,
                                onChanged: (value) {
                                  value
                                      ? theme.setDarkMode()
                                      : theme.setLightMode();
                                }),
                          ))
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
                                "assets/kerani-panen.png",
                                color: Palette.primaryColorProd,
                                height: 45,
                              ),
                              Text(
                                " KERANI",
                                style: Style.primaryBold18,
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
                              KeraniNotifier()
                                  .onClickedMenu(context, 'ABSENSI');
                            },
                            child: const Text("ABSENSI",
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
                              KeraniNotifier()
                                  .onClickedMenu(context, 'BUAT FORM OPH');
                            },
                            child: const Text("BUAT FORM OPH",
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
                              KeraniNotifier()
                                  .onClickedMenu(context, 'RIWAYAT OPH');
                            },
                            child: const Text("RIWAYAT OPH",
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
                              KeraniNotifier()
                                  .onClickedMenu(context, 'BACA KARTU OPH');
                            },
                            child: const Text("BACA KARTU OPH",
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
                              KeraniNotifier().onClickedMenu(
                                  context, 'RENCANA PANEN HARI INI');
                            },
                            child: const Text("RENCANA PANEN HARI INI",
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
                              KeraniNotifier()
                                  .onClickedMenu(context, 'BUAT FORM SPB');
                            },
                            child: const Text("BUAT FORM SPB",
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
                              KeraniNotifier()
                                  .onClickedMenu(context, 'RIWAYAT SPB');
                            },
                            child: const Text("RIWAYAT SPB",
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
                              KeraniNotifier()
                                  .onClickedMenu(context, 'BACA KARTU SPB');
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
                              KeraniNotifier().onClickedMenu(
                                  context, 'LAPORAN PANEN HARIAN');
                            },
                            child: const Text("LAPORAN PANEN HARIAN",
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
                              KeraniNotifier().onClickedMenu(
                                  context, 'LAPORAN SPB KEMARIN');
                            },
                            child: const Text("LAPORAN SPB KEMARIN",
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
                              KeraniNotifier().onClickedMenu(
                                  context, 'LAPORAN RESTAN HARI INI');
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("LAPORAN RESTAN HARI INI",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 4),
                                  countRestan == 0
                                      ? const SizedBox()
                                      : Row(children: [
                                          const Icon(Icons.warning,
                                              color: Colors.yellow),
                                          const SizedBox(width: 10),
                                          Text("$countRestan",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ])
                                ]),
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
                                  KeraniNotifier()
                                      .onClickedMenu(context, 'INSPECTION');
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
                              backgroundColor: Palette.yellowColorDark,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Palette.yellowColorDark)),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              KeraniNotifier()
                                  .onClickedMenu(context, 'ADMINISTRASI OPH');
                            },
                            child: const Text("ADMINISTRASI OPH",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Palette.yellowColorDark,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Palette.yellowColorDark)),
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onPressed: () {
                              KeraniNotifier()
                                  .onClickedMenu(context, 'ADMINISTRASI SPB');
                            },
                            child: const Text("ADMINISTRASI SPB",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
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
                              KeraniNotifier()
                                  .onClickedMenu(context, 'UPLOAD DATA OPH');
                            },
                            child: const Text("UPLOAD DATA OPH",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
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
                              KeraniNotifier()
                                  .onClickedMenu(context, 'UPLOAD DATA SPB');
                            },
                            child: const Text("UPLOAD DATA SPB",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: TextButton(
                        //     style: TextButton.styleFrom(
                        //       foregroundColor: Colors.white,
                        //       backgroundColor: Colors.green,
                        //       minimumSize:
                        //           Size(MediaQuery.of(context).size.width, 50),
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(5.0),
                        //           side: BorderSide(color: Colors.green)),
                        //       padding: const EdgeInsets.all(16.0),
                        //       textStyle: const TextStyle(
                        //           fontSize: 20, color: Colors.white),
                        //     ),
                        //     onPressed: () {
                        //       KeraniNotifier()
                        //           .onClickedMenu(context, 'UPLOAD DATA');
                        //     },
                        //     child: Text("UPLOAD DATA",
                        //         style: TextStyle(
                        //             fontSize: 14, fontWeight: FontWeight.bold)),
                        //   ),
                        // ),
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
                              KeraniNotifier().onClickedMenu(context, 'KELUAR');
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
                              const SizedBox(height: 20),
                              Text(
                                  "Estate ${homeNotifier.configSchema.estateCode}",
                                  style: Style.textBold14),
                              const SizedBox(height: 30),
                              InkWell(
                                onTap: () {
                                  KeraniNotifier()
                                      .showDialogSupervisi(supervisor!);
                                },
                                child: Text("Lihat Supervisi",
                                    style: Style.primaryBold16),
                              ),
                              const SizedBox(height: 30),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: const Text("Sync Ulang"),
                                    onTap: () {
                                      KeraniNotifier().reSynch();
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
                                      KeraniNotifier().exportJson(context);
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
            );
          },
        );
      },
    );
  }
}
