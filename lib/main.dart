import 'package:dokan/app/controllers/app_controller.dart';
import 'package:dokan/app/services/connectivity_service.dart';
import 'package:dokan/app/state/app_life_cycle.dart';
import 'package:dokan/router/routers.dart';
import 'package:dokan/utils/keys.dart';
import 'package:dokan/utils/rgb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // connectivity init
  ConnectivityServices.stream();
  // run app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // listen app life cycle
    AppLifeCycle.init(state);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: RGB.primary,
        ),
        useMaterial3: true,
      ),
      themeMode: AppController.themeMode(),
      navigatorKey: Keys.navigator,
      initialRoute: '/',
      getPages: Routers.initRoute,
    );
  }
}
