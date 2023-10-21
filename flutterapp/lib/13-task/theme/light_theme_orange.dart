part of 'theme.dart';

ThemeData createLightThemeOrange() {
  return ThemeData(
    textTheme: createTextTheme(),
    scaffoldBackgroundColor: AppColors.backgroundLightOrange,
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
      fillColor: AppColors.white,
      suffixIconColor: AppColors.primaryOrangeLightAndDark,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.white,
        ),
      ),
      labelStyle: titleMedium.copyWith(
        color: AppColors.secondaryTextLightDarkOrange,
      ),
    ),
    fontFamily: 'Sf Pro Display',
    useMaterial3: true,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.lightOrange,
    ],
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.white,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.primaryOrangeLightAndDark),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLightOrange,
      elevation: 0,
      titleTextStyle: labelLarge.copyWith(
        color: AppColors.primaryTextLightOrange,
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryOrangeLightAndDark),
    ),
  );
}
