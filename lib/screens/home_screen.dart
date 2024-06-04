import 'package:dokan/app/controllers/home_controller.dart';
import 'package:dokan/screens/components/home_component.dart';
import 'package:dokan/screens/widgets/bottom_navbar.dart';
import 'package:dokan/screens/widgets/floating_button.dart';
import 'package:dokan/utils/rgb.dart';
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
      backgroundColor: RGB.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButton.show,
      bottomNavigationBar: Obx(() {
        return BottomNavbar.show();
      }),
      body: SafeArea(
        child: Obx(() {
          return HomeComponents.allItems.elementAt(
            HomeController.selectedPage.value,
          );
        }),
      ),
    );
  }
}
