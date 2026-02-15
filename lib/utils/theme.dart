import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatholicTheme {
  // Modern Liturgical Palette (Option A)
  static const Color softWhite = Color(0xFFF8F9FB);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color lentenIndigo = Color(0xFF4B0082);
  static const Color deepSlate = Color(0xFF2D3436);
  static const Color subtleGrey = Color(0xFF6A608F); // Indigo-tinted grey
  static const Color lightGrey = Color(0xFFE2E0EB); // Very light indigo-grey
  static const Color goldAccent = Color(0xFFD4AF37); // Subtle secondary accent
  static const Color incenseWhite = Color(0xFFF2F0E9); // Warm, paper-like
  static const Color palmGreen = Color(0xFF3B5B3E); // Deep liturgical green
  static const Color sacredGold = Color(0xFFE5B80B); // Richer gold

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: lentenIndigo,
      onPrimary: pureWhite,
      secondary: subtleGrey,
      onSecondary: pureWhite,
      tertiary: goldAccent,
      onTertiary: pureWhite,
      surface: pureWhite,
      onSurface: deepSlate,
    ),

    scaffoldBackgroundColor: softWhite,

    // Typography
    textTheme: TextTheme(
      // Headlines (Playfair Display for Elegant/High-end feel)
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: lentenIndigo,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: deepSlate,
      ),
      displaySmall: GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: lentenIndigo,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: deepSlate,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: deepSlate,
      ),

      // Body (Inter - Modern, clean, highly readable)
      bodyLarge: GoogleFonts.inter(
        fontSize: 18,
        height: 1.6,
        color: deepSlate,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 16,
        height: 1.5,
        color: deepSlate.withValues(alpha: 0.85),
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 14,
        height: 1.4,
        color: subtleGrey,
      ),

      // UI Elements
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    ),

    // App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: softWhite,
      foregroundColor: deepSlate,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.playfairDisplay(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: lentenIndigo,
      ),
      iconTheme: const IconThemeData(color: lentenIndigo),
    ),

    // Cards - Clean, soft shadows
    cardTheme: CardThemeData(
      elevation: 4,
      shadowColor: lentenIndigo.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: pureWhite,
      margin: const EdgeInsets.only(bottom: 20),
    ),

    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lentenIndigo,
        foregroundColor: pureWhite,
        elevation: 10,
        shadowColor: lentenIndigo.withValues(alpha: 0.3),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: lentenIndigo,
        side: const BorderSide(color: lentenIndigo, width: 1.5),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: pureWhite,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: lightGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: lightGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: lentenIndigo, width: 2),
      ),
      contentPadding: const EdgeInsets.all(20),
      hintStyle: GoogleFonts.inter(color: subtleGrey.withValues(alpha: 0.5)),
      labelStyle: GoogleFonts.inter(color: subtleGrey),
    ),

    dividerTheme: const DividerThemeData(
      color: lightGrey,
      thickness: 1,
      space: 32,
    ),
  );

  static ThemeData darkTheme = lightTheme; // For now, keep it primarily light
}
