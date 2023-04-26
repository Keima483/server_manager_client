import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:server_manager_client/screen/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: DashboardScreen(),
    );
  }
}
