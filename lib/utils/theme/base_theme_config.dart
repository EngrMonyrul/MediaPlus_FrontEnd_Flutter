import 'package:flutter/material.dart';
import 'package:mediaplusfrontend/utils/theme/text_theme_config.dart';
import 'appbar_theme_config.dart';
import 'bottomsheet_theme_config.dart';
import 'checkbox_theme_config.dart';
import 'chip_theme_config.dart';
import 'colorscheme_theme_config.dart';
import 'elevatedbutton_theme_config.dart';
import 'outline_theme_config.dart';

class BaseThemeConfig {
  BaseThemeConfig._();

  /*------------------> Light Theme <-------------------*/
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    textTheme: AppsTextTheme.lightTextTheme,
    // elevatedButtonTheme: ElevatedButtonThemeConfig.elevatedButtonTheme,
    // appBarTheme: AppbarThemeConfig.lightAppbarTheme,
    bottomSheetTheme: BottomsheetThemeConfig.lightBottomSheetThemeData,
    // checkboxTheme: CheckboxThemeConfig.lightCheckBoxTheme,
    // chipTheme: ChipThemeConfig.lightChipThemeData,
    // outlinedButtonTheme: OutlineThemeConfig.outlineThemeData,
    // inputDecorationTheme: TextfieldThemeConfig.lightInputDecorationTheme,
    colorScheme: ColorSchemeThemeConfig.lightColorScheme,
  );

  /*------------------> Dark Theme <-------------------*/
  static final darkThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    textTheme: AppsTextTheme.darkTextTheme,
    // elevatedButtonTheme: ElevatedButtonThemeConfig.elevatedButtonTheme,
    // appBarTheme: AppbarThemeConfig.darkAppbarTheme,
    bottomSheetTheme: BottomsheetThemeConfig.darkBottomSheetThemeData,
    // checkboxTheme: CheckboxThemeConfig.darkCheckBoxTheme,
    // chipTheme: ChipThemeConfig.darkChipThemeData,
    // outlinedButtonTheme: OutlineThemeConfig.outlineThemeData,
    // inputDecorationTheme: TextfieldThemeConfig.darkInputDecorationTheme,
    colorScheme: ColorSchemeThemeConfig.darkColorScheme,
  );
}
