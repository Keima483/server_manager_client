import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:server_manager_client/controller/server_controller.dart';
import 'package:server_manager_client/model/server.dart';
import 'package:server_manager_client/screen/dashboard/components/pop_up_textfiels.dart';
import 'package:server_manager_client/screen/dashboard/components/popup_button.dart';

void editServerPopup(BuildContext context, Server server) {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: server.name);
  var id = server.id;
  var languageController = TextEditingController(text: server.language);
  var framworkController = TextEditingController(text: server.framework);
  var serverController = Get.put(ServerController());

  showDialog(
    context: context,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 400, vertical: 200),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Material(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Update Server',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PopUpTextField(
                  controller: nameController,
                  lable: 'Name',
                  validator: _validate,
                ),
                PopUpTextField(
                  controller: languageController,
                  lable: 'language',
                  validator: _validate,
                ),
                PopUpTextField(
                  controller: framworkController,
                  lable: 'Framwork',
                  validator: _validate,
                ),
                PopUpButton(
                  label: 'Update',
                  onPress: () async {
                    if (formKey.currentState!.validate()) {
                      var server = Server(
                        name: nameController.text,
                        id: id,
                        language: languageController.text,
                        framework: framworkController.text,
                      );
                      serverController.addOrUpdateServer(server);
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

String? _validate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Enter Something';
  }
  return null;
}
