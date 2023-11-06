import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle countText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: CColors.primary,
    fontFamily: 'Sf Pro Display',
  );
  static TextStyle imageLengthText = countText.copyWith(
    color: CColors.greyText,
  );
}

abstract class CColors {
  static Color primary = const Color(0xFF222222);
  static Color greyText = const Color(0xFFBFBFBF);
}
