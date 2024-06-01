import 'package:flutter/material.dart';

class CheckboxThemeConfig {
  CheckboxThemeConfig._();

  /*-------------> Light Theme <-------------*/
  static final CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(14)),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      },
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.blue;
        } else {
          return Colors.transparent;
        }
      },
    ),
  );

  /*-------------> Dark Theme <-------------*/
  static final CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(14)),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.grey;
        } else {
          return Colors.black;
        }
      },
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.blue;
        } else {
          return Colors.transparent;
        }
      },
    ),
  );
}
