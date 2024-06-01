import 'package:flutter/material.dart';

class OutlineThemeConfig {
  OutlineThemeConfig._();

  /*----------------> Light & Dark Theme <----------------*/
  static final OutlinedButtonThemeData outlineThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.blueAccent),
      textStyle: const TextStyle().copyWith(
          fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
