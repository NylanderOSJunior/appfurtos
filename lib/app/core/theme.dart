import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  primaryColor: Color.fromARGB(255, 2, 77, 189),
  primaryColorDark: const Color(0xFFE76901),
  scaffoldBackgroundColor: Color.fromARGB(255, 186, 233, 241),
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
  cardColor: const Color(0xFF737375),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFF48121),
    disabledColor: Color.fromARGB(255, 6, 144, 236),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color.fromARGB(255, 2, 77, 189),
    selectionColor: const Color.fromARGB(255, 2, 77, 189).withOpacity(0.5),
    selectionHandleColor: const Color.fromARGB(255, 2, 77, 189),
  ),
  colorScheme: const ColorScheme(
    primary: Color.fromARGB(255, 2, 77, 189),
    primaryVariant: Color(0xFFE76901),
    secondary: Color(0xFFF48121),
    secondaryVariant: Color(0xFFE76901),
    surface: Colors.red,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Color.fromARGB(255, 2, 77, 189),
    onSecondary: Color.fromARGB(255, 2, 77, 189),
    onSurface: Color.fromARGB(255, 2, 77, 189),
    onBackground: Colors.white,
    onError: Colors.red,
    brightness: Brightness.light,
  ),
);
