import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/theme/theme.dart';

extension BuildContextExtension on BuildContext {
  ThemeColors get colors => Theme.of(this).extension<ThemeColors>()!;
}