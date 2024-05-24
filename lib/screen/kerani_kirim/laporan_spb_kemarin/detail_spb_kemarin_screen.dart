import 'package:epms/base/ui/style.dart';
import 'package:epms/model/laporan_spb_kemarin.dart';
import 'package:flutter/material.dart';

class DetailSPBKemarinScreen extends StatefulWidget {
  const DetailSPBKemarinScreen({super.key, required this.laporanSPBKemarin});

  final LaporanSPBKemarin laporanSPBKemarin;

  @override
  State<DetailSPBKemarinScreen> createState() => _DetailSPBKemarinScreenState();
}

class _DetailSPBKemarinScreenState extends State<DetailSPBKemarinScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: Style.mediaQueryText(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail SPB Kemarin"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("ID OPH:"),
                    Text(
                      widget.laporanSPBKemarin.spbId ?? "",
                      style: Style.textBold16,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tanggal:"),
                    Text(
                        "${widget.laporanSPBKemarin.createdDate} ${widget.laporanSPBKemarin.createdTime}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("GPS Geolocation:"),
                    Text(
                        "${widget.laporanSPBKemarin.spbLat}, ${widget.laporanSPBKemarin.spbLong}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Jenis Pengangkutan:"),
                    Text("${widget.laporanSPBKemarin.spbType}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Estate:"),
                    Text("${widget.laporanSPBKemarin.spbEstateCode}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Tujuan:"),
                    Text(
                        "${widget.laporanSPBKemarin.spbDeliverToCode}, ${widget.laporanSPBKemarin.spbDeliverToName}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Pekerja:"),
                    Text("${widget.laporanSPBKemarin.spbDriverEmployeeCode}"),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text("No. Kendaraan"),
                      const SizedBox(height: 20),
                      Text(
                        "${widget.laporanSPBKemarin.spbLicenseNumber}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      const Text("Kartu SPB"),
                      const SizedBox(height: 20),
                      Text("${widget.laporanSPBKemarin.spbCardId}",
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total OPH:"),
                    Text("${widget.laporanSPBKemarin.spbTotalOph}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total janjang:"),
                    Text("${widget.laporanSPBKemarin.spbTotalBunches}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total brondolan (kg):"),
                    Text("${widget.laporanSPBKemarin.spbTotalLooseFruit}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Estimasi berat (kg):"),
                    Text("${widget.laporanSPBKemarin.spbEstimateTonnage}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sisa kapasitas truk (kg):"),
                    Text("${widget.laporanSPBKemarin.spbCapacityTonnage}")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Berat aktual (Kg):"),
                    Text("${widget.laporanSPBKemarin.spbActualTonnage}")
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Text("Catatan (50)"),
                  Text(widget.laporanSPBKemarin.spbDeliveryNote ?? "")
                ],
              ),
              const SizedBox(height: 20),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   child: InkWell(
              //     onTap: () {
              //       Navigator.pop(context);
              //     },
              //     child: Card(
              //       color: Palette.redColorDark,
              //       elevation: 2,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       child: Container(
              //         alignment: Alignment.center,
              //         padding: EdgeInsets.all(14),
              //         child: Text(
              //           "KEMBALI",
              //           style: TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white),
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ]),
          ),
        ),
      ),
    );
  }
}
