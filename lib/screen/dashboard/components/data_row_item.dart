import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:server_manager_client/controller/server_controller.dart';
import 'package:server_manager_client/model/server.dart';
import 'package:server_manager_client/screen/dashboard/components/edit_server_popup.dart';
import 'package:server_manager_client/utils/ui_style.dart';

// function to generate rows of data in the datatable
DataRow dataRowGenerator(BuildContext context, Server server) {
  return DataRow(
    cells: [
      DataCell(Text(
        server.id,
        style: itemStyle,
      )),
      DataCell(Text(
        server.name,
        style: itemStyle,
      )),
      DataCell(Text(
        server.language,
        style: itemStyle,
      )),
      DataCell(Text(
        server.framework,
        style: itemStyle,
      )),
      DataCell(
        Row(
          children: [
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () {
                editServerPopup(context, server);
              },
              color: Colors.yellow,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.edit,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete server?'),
                    content: Text(
                        'Are you sure you want to delete server "${server.name}"?'),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(
                            0x40ff0000,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          deleteServer(server.id);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Background color
                        ),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.delete,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

void deleteServer(String id) {
  var serverController = Get.put(ServerController());
  serverController.deleteServer(id);
}
