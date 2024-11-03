import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      buttonTheme: ButtonThemeData(buttonColor: Colors.grey[800]),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
