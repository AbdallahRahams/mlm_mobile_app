import 'package:flutter/material.dart';

// Define your application-wide theme here
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      hintColor: Colors.orange,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16.0),
        bodyMedium: TextStyle(fontSize: 14.0),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.blue),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      hintColor: Colors.orange,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16.0),
        bodyMedium: TextStyle(fontSize: 14.0),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.blue),
      ),
    );
  }
}
