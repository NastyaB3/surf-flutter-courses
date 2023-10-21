part of 'theme.dart';

ThemeData createDarkThemeBlue() {
  return ThemeData(
    textTheme: createTextTheme(),
    scaffoldBackgroundColor: AppColors.backgroundDarkBlue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlueLightAndDark,
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
      fillColor: AppColors.textFiledDarkBlue,
      suffixIconColor: AppColors.primaryBlueLightAndDark,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.textFiledDarkBlue,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.textFiledDarkBlue,
        ),
      ),
      labelStyle: titleMedium.copyWith(
        color: AppColors.secondaryTextLightDarkBlue,
      ),
    ),
    fontFamily: 'Sf Pro Display',
    useMaterial3: true,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.darkBlue,
    ],
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.textFiledDarkBlue,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primaryBlueLightAndDark),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDarkBlue,
      elevation: 0,
      titleTextStyle: labelLarge.copyWith(
        color: AppColors.white,
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryBlueLightAndDark),
    ),
  );
}
