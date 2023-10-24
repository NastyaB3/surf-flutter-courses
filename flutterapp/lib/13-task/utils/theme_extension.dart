import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/widgets/botton_dialog_widget.dart';
import 'package:flutterapp/13-task/widgets/get_theme.dart';

extension ThemeModeExtension on ThemeType {
  ThemeMode themeMode() {
    switch (this) {
      case ThemeType.system:
        return ThemeMode.system;
      case ThemeType.light || ThemeType.lightOrange || ThemeType.lightBlue:
        return ThemeMode.light;
      case ThemeType.dark || ThemeType.darkOrange || ThemeType.darkBlue:
        return ThemeMode.dark;
    }
  }

  ThemeData themeData() {
    return this == ThemeType.dark
        ? getTheme(ThemeType.dark)
        : this == ThemeType.darkBlue
        ? getTheme(ThemeType.darkBlue)
        : getTheme(ThemeType.darkOrange);
  }
}