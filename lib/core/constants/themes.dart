import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeData {
  static light() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xFFFF822B),
      hintColor: const Color(0xFF767676),
      // hintColor: const Color(0xFF767676),
      textTheme: TextTheme(
        titleSmall: TextStyle(
          color: Colors.blueGrey.shade700,
          fontWeight: FontWeight.bold,
          letterSpacing: .8,
          fontSize: 16,
        ),
        titleMedium: TextStyle(
          fontSize: 19,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey.shade800,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF0F0F0),
        systemOverlayStyle: SystemUiOverlayStyle(
          // statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        // titleTextStyle:
        // Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
        //   fontWeight: FontWeight.w500,
        // ),
      ),
    );
  }

  static dark() => ThemeData(
        // Define your dark theme properties here
        primarySwatch: Colors.teal,
        hintColor: Colors.deepOrange,
        // ... other properties
      );
}
