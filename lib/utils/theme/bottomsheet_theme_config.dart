import 'package:flutter/material.dart';

import 'colorscheme_theme_config.dart';

class BottomsheetThemeConfig {
  BottomsheetThemeConfig._();

  /*----------------> Light Theme <----------------*/
  static final BottomSheetThemeData lightBottomSheetThemeData =
      BottomSheetThemeData(
    showDragHandle: false,
    backgroundColor: ColorSchemeThemeConfig.lightColorScheme.secondary,
    modalBackgroundColor: ColorSchemeThemeConfig.lightColorScheme.secondary,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  /*----------------> Dark Theme <----------------*/
  static final BottomSheetThemeData darkBottomSheetThemeData =
      BottomSheetThemeData(
    showDragHandle: false,
    backgroundColor: ColorSchemeThemeConfig.darkColorScheme.secondary,
    modalBackgroundColor: ColorSchemeThemeConfig.darkColorScheme.secondary,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
