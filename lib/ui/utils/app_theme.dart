import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get appTheme {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xffE4E4E4),
      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //   backgroundColor: Color(0xff1D2038),
      // ),
      appBarTheme: const AppBarTheme(
        color: Color(0xff14213D),
      ),
    );
  }
}