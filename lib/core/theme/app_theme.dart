import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

/// Kumpulan style siap pakai: tipografi, dan ThemeData akhir
/// yang didaftarkan ke MaterialApp.
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        error: AppColors.error,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

/// Token spacing — dipakai sebagai pengganti angka "magic number"
/// (mis. SizedBox(height: 16)) di seluruh widget.
class AppSpacing {
  AppSpacing._();
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
}

/// Token radius — dipakai agar sudut membulat konsisten di semua komponen.
class AppRadius {
  AppRadius._();
  static const double md = 12;
}