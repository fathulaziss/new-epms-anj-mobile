import 'package:epms/base/ui/palette.dart';
import 'package:epms/base/ui/style.dart';
import 'package:epms/database/service/database_m_ancak_employee.dart';
import 'package:epms/model/m_ancak_employee.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class SearchAncakEmployeeScreen extends StatefulWidget {
  const SearchAncakEmployeeScreen({super.key});

  @override
  State<SearchAncakEmployeeScreen> createState() =>
      _SearchAncakEmployeeScreenState();
}

class _SearchAncakEmployeeScreenState extends State<SearchAncakEmployeeScreen> {
  TextEditingController typeFarmerController = TextEditingController();
  String? valFarmer;
  bool isLoading = true;
  ScrollController? scrollController;

  final List<MAncakEmployee> _searchEmployeeResult = [];

  List<MAncakEmployee> _employeeDetails = [];

  @override
  void initState() {
    getEmployeeList();
    super.initState();
  }

  getEmployeeList() async {
    isLoading = true;
    List<MAncakEmployee> listEmployee =
        await DatabaseMAncakEmployee().selectMAncakEmployeeSchema();
    setState(() {
      _employeeDetails = listEmployee;
      isLoading = false;
    });
  }

  onSearchTextChanged(String text) async {
    _searchEmployeeResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    for (var farmerDetail in _employeeDetails) {
      if (farmerDetail.userName!.toLowerCase().contains(text.toLowerCase())) {
        _searchEmployeeResult.add(farmerDetail);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Center(child: Text("Pencarian Karyawan Ancak"))),
      body: MediaQuery(
        data: Style.mediaQueryText(context),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                    controller: typeFarmerController,
                    decoration: const InputDecoration(
                        hintText: "Pencarian", border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      typeFarmerController.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
            isLoading
                ? const CircularProgressIndicator()
                : _employeeDetails.isNotEmpty
                    ? Flexible(
                        child: Container(
                          child: _searchEmployeeResult.isNotEmpty ||
                                  typeFarmerController.text.isNotEmpty
                              ? ListView.builder(
                                  controller: scrollController,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: _searchEmployeeResult.length,
                                  itemBuilder: (context, index) => Card(
                                        child: ListTile(
                                          title: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${_searchEmployeeResult[index].userId}",
                                                style: Style.textBold14,
                                              ),
                                              Text(
                                                  "${_searchEmployeeResult[index].userName}"),
                                            ],
                                          ),
                                          trailing: InkWell(
                                            onTap: () {
                                              Navigator.pop(context,
                                                  _searchEmployeeResult[index]);
                                            },
                                            child: Card(
                                              color: Palette.primaryColorProd,
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                              : _employeeDetails.isNotEmpty
                                  ? ListView.builder(
                                      controller: scrollController,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemCount: _employeeDetails.length,
                                      itemBuilder: (context, index) => Card(
                                        child: ListTile(
                                          title: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${_employeeDetails[index].userId}",
                                                style: Style.textBold14,
                                              ),
                                              Text(
                                                  "${_employeeDetails[index].userName}"),
                                            ],
                                          ),
                                          trailing: InkWell(
                                            onTap: () {
                                              Navigator.pop(context,
                                                  _employeeDetails[index]);
                                            },
                                            child: Card(
                                              color: Palette.primaryColorProd,
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const Flexible(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(RpgAwesome.palm_tree,
                                                color: Colors.orange, size: 60),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 20.0),
                                              child: Text("Belum ada Pekerja"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                        ),
                      )
                    : const Flexible(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(RpgAwesome.palm_tree,
                                  color: Colors.orange, size: 60),
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text("Belum ada Pekerja"),
                              ),
                            ],
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
