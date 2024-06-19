import 'package:flutter/material.dart';

class AppTheme{
  static Color primary = const Color(0xFF00C853);
  static Color secondary = const Color(0xFF2979FF);
  static Color accent = const Color(0xFFFF7043);

  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme(
      primary: AppTheme.primary, // Vibrant Green
      secondary: AppTheme.secondary, // Electric Blue
      surface: const Color(0xFF424242), // Dark Gray
      error: const Color(0xFFFF7043), // Energetic Orange
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: const Color(0xFFE0E0E0), // Light Gray (text on dark surfaces)
      onError: Colors.white,
      brightness: Brightness.light, // Light mode. Might implement dark mode in the future
    ),
    scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFFFF7043), // Energetic Orange
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: Typography.material2021().white,
    fontFamily: 'Roboto',
    fontFamilyFallback: const <String>['Montserrat, Arial, sans-serif'],
  );
}