import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:server_manager_client/model/server.dart';
import 'package:http/http.dart' as http;
import 'package:server_manager_client/utils/endpoints.dart' as endpoints;

// State management controller class using using get package
class ServerController extends GetxController {
  var serverList = <Server>[].obs;
  var isServerON = true.obs;
  var isLoading = false.obs;

  // function that runs when this class is initialised
  @override
  void onInit() {
    super.onInit();
    getAllServers();
  }

  // functions to get all servers
  void getAllServers() async {
    isLoading(true);
    var response = await http.get(Uri.parse(endpoints.server));
    if (response.statusCode < 299) {
      _getServersFromJSON(response.body);
      isServerON(true);
    } else if (response.statusCode < 499) {
      showSnackBar("Error!", "Some Error Occured");
      isServerON(true);
    } else {
      isServerON(false);
    }
    isLoading(false);
  }

  // function to delete a server with a perticular server id
  void deleteServer(String id) async {
    isLoading(true);
    var response = await http.delete(Uri.parse('${endpoints.server}/$id'));
    if (response.statusCode < 299) {
      getAllServers();
    } else if (response.statusCode < 499) {
      showSnackBar("Error!", jsonDecode(response.body)['message']);
    } else {
      showSnackBar("Error!", "Some Problem Occured");
    }
    isLoading(false);
  }

  // functions to add or uodate an existing server
  void addOrUpdateServer(Server server) async {
    isLoading(true);
    var response = await http.put(
      Uri.parse(endpoints.server),
      body: serverToJson(server),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode < 299) {
      getAllServers();
    } else if (response.statusCode < 499) {
      showSnackBar("Error!", jsonDecode(response.body)['message']);
    } else {
      showSnackBar("Error!", "Some Problem Occured");
    }
    isLoading(false);
  }

  // function to search servers by name
  void searchServerName(String name) async {
    if (name.trim().isEmpty) {
      getAllServers();
      return;
    }
    isLoading(true);
    var response = await http.get(Uri.parse('${endpoints.find}?name=$name'));
    if (response.statusCode < 299) {
      _getServersFromJSON(response.body);
    } else if (response.statusCode < 499) {
      showSnackBar("Oh No!", "No Server with this name");
    } else {
      showSnackBar("Error!", "Some Problem Occured");
    }
    isLoading(false);
  }

  // helper function to update server list with the new data from json response
  void _getServersFromJSON(String body) {
    var servers = <Server>[];
    var items = jsonDecode(body) as List;
    for (var item in items) {
      servers.add(Server.fromJson(Map.from(item)));
    }
    serverList.value = servers;
    notifyChildrens();
  }

  void showSnackBar(String title, String content) {
    Get.snackbar(
      "Oh No!",
      "No Server with this name",
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
