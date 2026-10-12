import 'package:flutter/material.dart';

/// Definisi warna dasar (raw color values), dipakai sebagai bahan
/// membangun ThemeData di app_theme.dart.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF7B2D8E);
  static const Color primaryLight = Color(0xFF9B4DB0);
  static const Color primaryDark = Color(0xFF5A1D6B);

  static const Color background = Color(0xFFFAF7FB);
  static const Color surface = Colors.white;

  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B6B7B);

  static const Color error = Color(0xFFF44336);
}