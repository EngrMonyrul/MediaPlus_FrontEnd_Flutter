import 'package:flutter/material.dart';

class ChipThemeConfig {
  ChipThemeConfig._();

  /*----------------> Light Theme <--------------*/
  static final ChipThemeData lightChipThemeData = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle().copyWith(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.all(12),
    checkmarkColor: Colors.white,
  );

  /*----------------> Dark Theme <--------------*/
  static final ChipThemeData darkChipThemeData = ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(color: Colors.white),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.all(12),
    checkmarkColor: Colors.white,
  );
}
