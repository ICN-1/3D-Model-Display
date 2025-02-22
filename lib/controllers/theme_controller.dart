import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> _currentTheme = ThemeMode.system.obs;
  ThemeMode get currentTheme => _currentTheme.value;

  void onSetCurrent(String theme) {
    _currentTheme.value = theme == "light" ? ThemeMode.light : ThemeMode.dark;
  }
}
