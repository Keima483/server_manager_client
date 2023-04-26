import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:server_manager_client/controller/server_controller.dart';
import 'package:server_manager_client/screen/dashboard/components/add_server_popup.dart';
import 'package:server_manager_client/utils/ui_style.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final serverController = Get.put(ServerController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80,
          width: size.width - 300,
          child: TextFormField(
            decoration: searchFieldDecoration,
            style: const TextStyle(fontSize: 30),
            onChanged: (String? value) {
              if (value != null) {
                serverController.searchServerName(value);
              }
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 220,
            height: 60,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.green,
              onPressed: () {
                addServerPopUp(context);
              },
              icon: const Icon(
                Icons.add,
                size: 35,
                color: Colors.black,
              ),
              label: const Text(
                'Add Server',
                style: addButtonStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
