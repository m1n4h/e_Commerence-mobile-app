import 'package:flutter/material.dart';


class AppThemes {

    // light theme
  static final ThemeData light = ThemeData(
    primaryColor: const Color(0xFFff5722),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFff5722),
      primary: const Color(0xFFff5722),
      brightness: Brightness.light,
      surface: Colors.white,
    ),
    cardColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFff5722),
      unselectedItemColor: const Color.fromARGB(255, 200, 198, 197),
    ),
  );


  // dark theme

    static final ThemeData dart = ThemeData(
    primaryColor: const Color(0xFFff5722),
    scaffoldBackgroundColor: const Color.fromARGB(240, 16, 16, 14),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: const Color.fromARGB(240, 16, 16, 14),
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFff5722),
      primary: const Color(0xFFff5722),
      brightness: Brightness.dark,
      surface: const Color.fromARGB(240, 16, 16, 14),
    ),
    cardColor: const Color.fromARGB(255, 30, 22, 22),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: const Color.fromARGB(255, 30, 22, 22),
      selectedItemColor: const Color(0xFFff5722),
      unselectedItemColor: const Color.fromARGB(255, 200, 198, 197),
    ),
  );
}