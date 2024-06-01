import 'package:flutter/material.dart';

class ElevatedButtonThemeConfig {
  ElevatedButtonThemeConfig._();

  /*----------------> For Light and Dark Theme <------------------*/
  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle().copyWith(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
