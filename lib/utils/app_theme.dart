import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData get theme => ThemeData(
    colorScheme: const ColorScheme(
      primary: Color(0xFF00C853), // Vibrant Green
      secondary: Color(0xFF2979FF), // Electric Blue
      surface: Color(0xFF424242), // Dark Gray
      error: Color(0xFFFF7043), // Energetic Orange
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFFE0E0E0), // Light Gray (text on dark surfaces)
      onError: Colors.white,
      brightness: Brightness.light, // Light mode. Might implement dark mode in the future
    ),
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFFF7043), // Energetic Orange
    textTheme: ButtonTextTheme.primary,
    ),
    textTheme: Typography.material2021().white,
  );
}