import 'package:dokan/app/controllers/home_controller.dart';
import 'package:dokan/screens/components/home_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return HomeComponents.list.elementAt(
          HomeController.selectedPage.value,
        );
      }),
    );
  }
}
