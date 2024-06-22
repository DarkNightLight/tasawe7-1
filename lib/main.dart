// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bindings/initialbindings.dart';
import 'services/theme/firebase_options.dart';
import 'services/theme/Theme_Manager.dart';
import 'services/theme/theme_cons.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:Tasawe7/view/screen/SplashScreen.dart';
import 'package:Tasawe7/view/screen/OnboardingScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  await GetStorage.init();
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = GetStorage();

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFirstTime = box.read('isFirstTime') ?? true;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TASAWE7',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: isFirstTime ? const OnboardingScreen() : SplashScreen(),
      initialBinding: InitialBindings(),
    );
  }
}
