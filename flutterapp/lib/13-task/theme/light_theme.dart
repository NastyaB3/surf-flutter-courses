part of 'theme.dart';

ThemeData createLightThemeGreen() {
  return ThemeData(
    textTheme: createTextTheme(),
    scaffoldBackgroundColor: AppColors.white,
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
      fillColor: AppColors.backgroundFormLightGreen,
      suffixIconColor: AppColors.primaryGreenLightAndDark,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.backgroundFormLightGreen,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.backgroundFormLightGreen,
        ),
      ),
      labelStyle: titleMedium.copyWith(
        color: AppColors.secondaryTextGreen,
      ),
    ),
    fontFamily: 'Sf Pro Display',
    useMaterial3: true,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.light,
    ],
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.white,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primaryGreenLightAndDark),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: labelLarge.copyWith(
        color: AppColors.primaryTextLightGreen,
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryGreenLightAndDark),
    ),
  );
}
