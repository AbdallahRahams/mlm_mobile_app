import 'package:flutter/material.dart';

// Define your application-wide theme here
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      accentColor: Colors.orange,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16.0),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.blue),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      accentColor: Colors.orange,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16.0),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.blue),
      ),
    );
  }
}
