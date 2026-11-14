import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xFFF3F8F6);
  static const primary = Color(0xFF168478);
  static const deep = Color(0xFF14636A);
  static const ink = Color(0xFF203D42);
  static const muted = Color(0xFF61757A);
  static const surface = Color(0xFFFFFFFF);
  static const secondary = Color(0xFFE4F2ED);
  static const accent = Color(0xFFE77E43);
  static const danger = Color(0xFFCB4545);
  static const success = Color(0xFF258451);
  static const warning = Color(0xFFD4A32D);
  static const border = Color(0xFFD9E6E1);
  static const hero = LinearGradient(
    colors: [primary, deep], begin: Alignment.topLeft, end: Alignment.bottomRight,
  );
}

ThemeData appTheme() => ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary).copyWith(
    primary: AppColors.primary, secondary: AppColors.accent,
    surface: AppColors.surface, onSurface: AppColors.ink,
    error: AppColors.danger,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true, fillColor: AppColors.surface,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.border)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.border)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),
  filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(
    minimumSize: const Size(0, 52),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  )),
);
