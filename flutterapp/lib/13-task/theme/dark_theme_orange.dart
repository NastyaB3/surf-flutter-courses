part of 'theme.dart';

ThemeData createDarkThemeOrange() {
  return ThemeData(
    textTheme: createTextTheme(),
    scaffoldBackgroundColor: AppColors.primaryTextLightOrange,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryOrangeLightAndDark,
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
      fillColor: AppColors.secondaryOrangeDark,
      suffixIconColor: AppColors.primaryOrangeLightAndDark,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.secondaryOrangeDark,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.secondaryOrangeDark,
        ),
      ),
      labelStyle: titleMedium.copyWith(
        color: AppColors.secondaryTextLightDarkOrange,
      ),
    ),
    fontFamily: 'Sf Pro Display',
    useMaterial3: true,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.darkOrange,
    ],
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.secondaryOrangeDark,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primaryOrangeLightAndDark),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryTextLightOrange,
      elevation: 0,
      titleTextStyle: labelLarge.copyWith(
        color: AppColors.white,
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryOrangeLightAndDark),
    ),
  );
}
