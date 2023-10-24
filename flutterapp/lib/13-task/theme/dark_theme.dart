part of 'theme.dart';

ThemeData createDarkTheme() {
  return ThemeData(
    textTheme: createTextTheme(),
    scaffoldBackgroundColor: AppColors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueButtonLightAndDark,
        elevation: 0,
        textStyle: bodyMedium,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.red,
        elevation: 0,
        textStyle: bodyMedium,
        side: const BorderSide(
          color: AppColors.red,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundFormDark,
      suffixIconColor: AppColors.primaryGreenLightAndDark,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.backgroundFormDark,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.backgroundFormDark,
        ),
      ),
      labelStyle: titleMedium.copyWith(
        color: AppColors.secondaryTextGreen,
      ),
    ),
    fontFamily: 'Sf Pro Display',
    useMaterial3: true,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.dark,
    ],
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.backgroundFormDark,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primaryGreenLightAndDark),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      titleTextStyle: labelLarge.copyWith(
        color: AppColors.white,
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryGreenLightAndDark),
    ),
  );
}
