import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:server_manager_client/screen/dashboard/dashboard.dart';

// Entery point into the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // make Material App with global context
    return GetMaterialApp(
      // The first page to reneder will be the dashboard
      home: DashboardScreen(),
    );
  }
}
