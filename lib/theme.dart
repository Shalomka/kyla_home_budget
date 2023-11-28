import 'package:flutter/material.dart';

// Main theme of the app
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 39, 85, 176),
    brightness: Brightness.dark,
    background: const Color.fromARGB(255, 35, 34, 75),
    tertiary: const Color.fromARGB(255, 30, 67, 132),
    primaryContainer: const Color.fromARGB(255, 48, 47, 104),
  ),
  // text theme
  textTheme: const TextTheme(
    // title large
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 176, 42, 87),
    ),
    // title medium
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    // title small
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 30, 67, 132),
    ),
    // body large
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    // body medium
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    // body small
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
  ),
);
