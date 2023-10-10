part of 'theme.dart';

ThemeData createLightTheme() {
  return ThemeData(
    textTheme: createTextTheme(),
    scaffoldBackgroundColor: AppColors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        elevation: 0,
        textStyle: bodyMedium,
        foregroundColor: AppColors.redLightAndDark,
        side: const BorderSide(
          color: AppColors.redLightAndDark,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    fontFamily: 'Sf Pro Display',
    useMaterial3: true,
    // extensions: <ThemeExtension<dynamic>>[
    //   ThemeColors.light,
    //
    // ],

    dialogTheme: DialogTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: titleMedium.copyWith(
        // color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    contentTextStyle: titleMedium,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: labelLarge.copyWith(
        color: AppColors.appBarTitleLight,
      ),
      iconTheme: const IconThemeData(color: AppColors.greenLightAndDark),
    ),
  );
}
