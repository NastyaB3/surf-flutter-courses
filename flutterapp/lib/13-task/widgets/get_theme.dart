import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/theme/theme.dart';
import 'package:flutterapp/13-task/widgets/botton_dialog_widget.dart';

ThemeData getTheme(ThemeType type) {
  switch (type) {
    case ThemeType.system:
      return createLightThemeGreen();
    case ThemeType.light:
      return createLightThemeGreen();
    case ThemeType.dark:
      return createDarkTheme();
    case ThemeType.lightOrange:
      return createLightThemeOrange();
    case ThemeType.lightBlue:
      return createLightThemeBlue();
    case ThemeType.darkOrange:
      return createDarkThemeOrange();
    case ThemeType.darkBlue:
      return createDarkThemeBlue();
  }
}

String getThemeName(ThemeType type) {
  switch (type) {
    case ThemeType.system:
      return 'Системная';
    case ThemeType.light:
      return 'Светлая';
    case ThemeType.dark:
      return 'Темная';
    case ThemeType.lightOrange:
      return 'Светлая';
    case ThemeType.lightBlue:
      return 'Светлая';
    case ThemeType.darkOrange:
      return 'Темная';
    case ThemeType.darkBlue:
      return 'Темная';
  }
}



