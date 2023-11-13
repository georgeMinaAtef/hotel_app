import 'package:flutter/material.dart';

class HotelAppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Colors.blue, // Your primary color
      hintColor: Colors.green, // Your accent color
      fontFamily: 'Roboto', // Your preferred font
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue, // App bar background color
        elevation: 0, // Remove shadow from app bar
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white, // App bar text color
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ).bodyMedium, titleTextStyle: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white, // App bar text color
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ).bodyMedium,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        labelMedium: TextStyle(
          fontSize: 16.0,
          color: Colors.black54,
        ),
        labelLarge: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Elevated button color
        ),
      ),
    );
  }
}
