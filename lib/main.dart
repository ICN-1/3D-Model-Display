import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_dimensional_display/bindings/app_bindings.dart';
import 'package:three_dimensional_display/controllers/theme_controller.dart';
import 'package:three_dimensional_display/screens/home_Screen.dart';
import 'package:three_dimensional_display/utils/constants/app_texts.dart';
import 'package:three_dimensional_display/utils/constants/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
      title: AppTexts.appName,
      themeMode: themeController.currentTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
    ),);
  }
}
