part of 'theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color textFieldInitValueColor;
  final Color radioListTileColor;
  final Color saveColor;
  final Color secondaryTextColor;
  final Color dropBackgroundColor;

  const ThemeColors({
    required this.textFieldInitValueColor,
    required this.radioListTileColor,
    required this.saveColor,
    required this.secondaryTextColor,
    required this.dropBackgroundColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? textFieldInitValueColor,
    Color? radioListTileColor,
    Color? saveColor,
    Color? secondaryTextColor,
    Color? dropBackgroundColor,
  }) {
    return ThemeColors(
      textFieldInitValueColor:
          textFieldInitValueColor ?? this.textFieldInitValueColor,
      radioListTileColor: radioListTileColor ?? this.radioListTileColor,
      saveColor: saveColor ?? this.saveColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      dropBackgroundColor: dropBackgroundColor ?? this.dropBackgroundColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      textFieldInitValueColor: Color.lerp(
          textFieldInitValueColor, other.textFieldInitValueColor, t)!,
      radioListTileColor:
          Color.lerp(radioListTileColor, other.radioListTileColor, t)!,
      saveColor: Color.lerp(saveColor, other.saveColor, t)!,
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      dropBackgroundColor:
          Color.lerp(dropBackgroundColor, other.dropBackgroundColor, t)!,
    );
  }

  static get light => const ThemeColors(
        textFieldInitValueColor: AppColors.primaryTextLightGreen,
        radioListTileColor: AppColors.primaryTextLightGreen,
        saveColor: AppColors.primaryGreenLightAndDark,
        secondaryTextColor: AppColors.secondaryTextGreen,
        dropBackgroundColor: AppColors.backgroundDropGreenLight,
      );

  static get lightBlue => const ThemeColors(
        textFieldInitValueColor: AppColors.backgroundDarkBlue,
        radioListTileColor: AppColors.black,
        saveColor: AppColors.primaryBlueLightAndDark,
        secondaryTextColor: AppColors.secondaryTextLightDarkBlue,
        dropBackgroundColor: AppColors.backgroundDropBlueLight,
      );

  static get lightOrange => const ThemeColors(
        textFieldInitValueColor: AppColors.primaryTextLightOrange,
        radioListTileColor: AppColors.black,
        saveColor: AppColors.primaryOrangeLightAndDark,
        secondaryTextColor: AppColors.secondaryTextLightDarkOrange,
        dropBackgroundColor: AppColors.backgroundDropOrangeLight,
      );

  static get dark => const ThemeColors(
        textFieldInitValueColor: AppColors.white,
        radioListTileColor: AppColors.white,
        saveColor: AppColors.primaryGreenLightAndDark,
        secondaryTextColor: AppColors.secondaryTextGreen,
        dropBackgroundColor: AppColors.backgroundDropGreenDark,
      );

  static get darkBlue => const ThemeColors(
        textFieldInitValueColor: AppColors.white,
        radioListTileColor: AppColors.white,
        saveColor: AppColors.primaryBlueLightAndDark,
        secondaryTextColor: AppColors.secondaryTextLightDarkBlue,
        dropBackgroundColor: AppColors.backgroundDropBlueDark,
      );

  static get darkOrange => const ThemeColors(
        textFieldInitValueColor: AppColors.white,
        radioListTileColor: AppColors.white,
        saveColor: AppColors.primaryOrangeLightAndDark,
        secondaryTextColor: AppColors.secondaryTextLightDarkOrange,
        dropBackgroundColor: AppColors.backgroundDropOrangeDark,
      );
}
