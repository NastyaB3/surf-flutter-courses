import 'package:flutter/material.dart';
import 'package:flutterapp/16-task/utils/custom_colors.dart';

get appTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        primary: CustomColors.primaryColor,
        secondary: CustomColors.iconBackgroundActiveColor,
        tertiary: CustomColors.textFieldColor,
        seedColor: CustomColors.iconBackgroundActiveColor,
        background: CustomColors.colorBackground,
        primaryContainer: CustomColors.whiteColor,
        secondaryContainer: CustomColors.iconBackgroundActiveColor,
        onBackground: CustomColors.disabledButtonColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          foregroundColor: CustomColors.iconBackgroundActiveColor,
        ),
      ),
      datePickerTheme: const DatePickerThemeData(
        headerBackgroundColor: CustomColors.iconBackgroundActiveColor,
      ),
      fontFamily: 'Sf Pro Display',
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
