import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:server_manager_client/controller/server_controller.dart';
import 'package:server_manager_client/model/server.dart';
import 'package:server_manager_client/screen/dashboard/components/search_bar.dart';
import 'package:server_manager_client/utils/ui_style.dart';

import 'components/data_row_item.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final serverController = Get.put(ServerController());
  final columnNames = [
    'Id',
    'Name',
    'Language',
    'Framwork',
    'Actions',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.black,
              Colors.grey,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Obx(() {
          return !serverController.isServerON.value
              ? const Center(
                  child: Image(
                    image: AssetImage(
                      'assets/images/server_off.jpg',
                    ),
                  ),
                )
              : Column(
                  children: [
                    SearchBar(size: size),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      height: size.height - 160,
                      width: size.width - 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(
                          0x40ffffff,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Obx(() {
                          return DataTable(
                            columns: [
                              ...columnNames.map(
                                (e) => DataColumn(
                                    label: Text(
                                  e,
                                  style: columnHeadingStyle,
                                )),
                              )
                            ],
                            rows: [
                              ...serverController.serverList.map(
                                (Server server) =>
                                    dataRowGenerator(context, server),
                              )
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
