import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSchemeThemeConfig {
  ColorSchemeThemeConfig._();

  static final lightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.light,
    primary: Colors.orange,
    onPrimary: Colors.blue,
    secondary: Colors.white,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.green,
    tertiary: Colors.grey,
    onTertiary: CupertinoColors.systemGrey5,
  );

  static final darkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.dark,
    primary: Colors.orange,
    onPrimary: Colors.blue,
    secondary: Colors.black,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.green,
    tertiary: Colors.grey,
    onTertiary: CupertinoColors.systemGrey5,
  );
}
