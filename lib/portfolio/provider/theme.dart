// ignore_for_file: always_use_package_imports, avoid_positional_boolean_parameters, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants.dart';

final themeProvider = ChangeNotifierProvider((ref) => CustomThemeProvider());

class CustomThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  ThemeData get getCurrentTheme =>
      isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme;

  void changeTheme(bool? val) {
    if (val != null) {
      themeMode = val ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: const Color(0xFFFFD800),
    iconTheme: const IconThemeData(color: kPrimaryColor),
    primarySwatch: Colors.yellow,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          kBackgroundColor,
        ),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(7, 17, 26, 1),
    colorScheme: const ColorScheme.dark(),
    primarySwatch: Colors.yellow,
    primaryColor: const Color(0xFFFFD800),
    iconTheme: IconThemeData(color: Colors.grey[400]),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
  );
}
