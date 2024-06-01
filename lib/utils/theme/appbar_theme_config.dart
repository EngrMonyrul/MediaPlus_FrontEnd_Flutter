import 'package:flutter/material.dart';

class AppbarThemeConfig {
  AppbarThemeConfig._();

  /*-----------------> Light Theme <----------------*/
  static final AppBarTheme lightAppbarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black, size: 14),
    actionsIconTheme: const IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
  );

  /*-----------------> Dark Theme <----------------*/
  static final AppBarTheme darkAppbarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black, size: 14),
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: const TextStyle().copyWith(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
  );
}
