import 'package:flutter/material.dart';
import 'package:three_dimensional_display/utils/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.black,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.white,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.pink,),
    ),
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextThemes.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColors.grey,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.dark,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.pink,),
    ),
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextThemes.darkTextTheme,
  );
}

class TextThemes {
  TextThemes._();

  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(color: AppColors.black),
    displayMedium: TextStyle(color: AppColors.black),
    displaySmall: TextStyle(color: AppColors.black),
    headlineLarge: TextStyle(color: AppColors.black),
    headlineMedium: TextStyle(color: AppColors.black),
    headlineSmall: TextStyle(color: AppColors.black),
    titleLarge: TextStyle(color: AppColors.black),
    titleMedium: TextStyle(color: AppColors.black),
    titleSmall: TextStyle(color: AppColors.black),
    bodyLarge: TextStyle(color: AppColors.black),
    bodyMedium: TextStyle(color: AppColors.black),
    bodySmall: TextStyle(color: AppColors.black),
    labelLarge: TextStyle(color: AppColors.black),
    labelMedium: TextStyle(color: AppColors.black),
    labelSmall: TextStyle(color: AppColors.black),
  );

  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(color: AppColors.grey),
    displayMedium: TextStyle(color: AppColors.grey),
    displaySmall: TextStyle(color: AppColors.grey),
    headlineLarge: TextStyle(color: AppColors.grey),
    headlineMedium: TextStyle(color: AppColors.grey),
    headlineSmall: TextStyle(color: AppColors.grey),
    titleLarge: TextStyle(color: AppColors.grey),
    titleMedium: TextStyle(color: AppColors.grey),
    titleSmall: TextStyle(color: AppColors.grey),
    bodyLarge: TextStyle(color: AppColors.grey),
    bodyMedium: TextStyle(color: AppColors.grey),
    bodySmall: TextStyle(color: AppColors.grey),
    labelLarge: TextStyle(color: AppColors.grey),
    labelMedium: TextStyle(color: AppColors.grey),
    labelSmall: TextStyle(color: AppColors.grey),
  );
}