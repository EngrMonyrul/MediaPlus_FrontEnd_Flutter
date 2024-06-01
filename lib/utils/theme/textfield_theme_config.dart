import 'package:flutter/material.dart';

class TextfieldThemeConfig {
  TextfieldThemeConfig._();

  /*---------------> Light Theme <----------------*/
  static final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.grey)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.grey)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.black12)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.red)),
    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.orange)),
  );

  /*---------------> Dark Theme <----------------*/
  static final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.grey)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.grey)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.white)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.red)),
    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(width: 1, color: Colors.orange)),
  );
}