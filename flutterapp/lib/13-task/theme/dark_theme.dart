part of 'theme.dart';


ThemeData createDarkTheme() {
  return ThemeData(
    textTheme: createTextTheme(),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueButtonLightAndDark,
        elevation: 0,
        textStyle: bodyMedium,
        foregroundColor: AppColors.scaffoldBackgroundDark,

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
      fillColor: AppColors.backgroundFormDark,
      suffixIconColor: AppColors.greenLightAndDark,
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.backgroundFormDark,
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
    //todo: change
    
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: AppColors.backgroundFormDark,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.greenLightAndDark),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundDark,
      elevation: 0,
      titleTextStyle: labelLarge.copyWith(
        color: AppColors.appBarTitleDark,
      ),
      iconTheme: const IconThemeData(color: AppColors.greenLightAndDark),
    ),
  );
}
