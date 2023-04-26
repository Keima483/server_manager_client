import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:server_manager_client/controller/server_controller.dart';
import 'package:server_manager_client/model/server.dart';
import 'package:server_manager_client/screen/dashboard/components/pop_up_textfiels.dart';
import 'package:server_manager_client/screen/dashboard/components/popup_button.dart';

void addServerPopUp(BuildContext context) {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var idController = TextEditingController();
  var languageController = TextEditingController();
  var framworkController = TextEditingController();
  var serverController = Get.put(ServerController());

  showDialog(
    context: context,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 400, vertical: 150),
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
                  'Add Server',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PopUpTextField(
                  controller: idController,
                  lable: 'Id',
                  validator: _validate,
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
                  label: 'Save',
                  onPress: () async {
                    if (formKey.currentState!.validate()) {
                      var server = Server(
                        name: nameController.text,
                        id: idController.text,
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
