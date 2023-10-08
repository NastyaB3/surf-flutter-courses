import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/theme/text_theme.dart';

ThemeData createLightTheme(){
  return ThemeData(
    textTheme: createTextTheme(),
    brightness: Brightness.light,
  );
}