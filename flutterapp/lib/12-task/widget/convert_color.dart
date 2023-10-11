import 'package:flutter/material.dart';

String getRgbColor(String colorName) {
  colorName = colorName.replaceAll("#", "");
  int intValue = int.parse(colorName, radix: 16);
  int red = (intValue >> 16) & 0xFF;
  int green = (intValue >> 8) & 0xFF;
  int blue = intValue & 0xFF;
  return '$red, $green, $blue';
}

Color hexToColor(String colorName) {
  return Color(
      int.parse(colorName.substring(1, 7).replaceAll('#', ''), radix: 16) +
          0xFF000000);
}
