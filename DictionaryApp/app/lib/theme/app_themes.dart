import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class AppThemes {
  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme(
        secondary: AppColors.secondary,
        onPrimary: AppColors.primary,
        primary: AppColors.primary,
        brightness: Brightness.dark,
        error: AppColors.lightRed,
        background: AppColors.background,
        onBackground: AppColors.white,
        surface: AppColors.white,
        onError: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.white,
        primaryVariant: AppColors.secondary,
        secondaryVariant: AppColors.lightPurple),
    focusColor: AppColors.lightPurple,
    primaryColorLight: AppColors.lightPurple,
    primaryColorDark: AppColors.primary,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scrollbarTheme: ScrollbarThemeData(
      thumbVisibility: MaterialStateProperty.all<bool>(true),
    ),
    scaffoldBackgroundColor: AppColors.primary, // set color background screen
    //fontFamily: 'montserrat',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    ),
    hintColor: AppColors.primary.withOpacity(0.5),
  );
}
