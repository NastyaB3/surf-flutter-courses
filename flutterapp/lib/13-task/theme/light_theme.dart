part of 'theme.dart';

ThemeData createLightTheme() {
  return ThemeData(
    textTheme: createTextTheme(),
    scaffoldBackgroundColor: AppColors.appBarTitleDark,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueButtonLightAndDark,
        elevation: 0,
        textStyle: bodyMedium,
        foregroundColor: AppColors.appBarTitleDark,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.redLightAndDark,
        elevation: 0,
        textStyle: bodyMedium,
        side: const BorderSide(
          color: AppColors.redLightAndDark,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundFormLight,
      suffixIconColor: AppColors.greenLightAndDark,
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.backgroundFormLight,
        ),
      ),
      labelStyle: titleMedium.copyWith(
        color: AppColors.formTextLightAndDark,
      ),
    ),
    fontFamily: 'Sf Pro Display',
    useMaterial3: true,
    // extensions: <ThemeExtension<dynamic>>[
    //   ThemeColors.light,
    //
    // ],
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: AppColors.appBarTitleDark,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.greenLightAndDark),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarTitleDark,
      elevation: 0,
      titleTextStyle: labelLarge.copyWith(
        color: AppColors.appBarTitleLight,
      ),
      iconTheme: const IconThemeData(color: AppColors.greenLightAndDark),
    ),
  );
}
