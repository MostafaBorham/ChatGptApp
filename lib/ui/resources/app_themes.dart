import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:chat_gpt_app/ui/resources/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData getLightModeTheme() => ThemeData(
        fontFamily: AppFonts.raleway,
        colorScheme: ColorScheme.light(
          primaryFixed: AppColors.grey_b6b6c9,
          onPrimaryFixed: AppColors.black,
          primaryContainer: AppColors.black_opc8,
          surface: AppColors.green_085e49,
          onSurface: AppColors.black_opc20,
          primary: AppColors.white_b2c2c2,
          outline: AppColors.black_opc40,
          onPrimary: AppColors.grey_9b9bbb,
          error: AppColors.red,
          onError: AppColors.brown_55523b,
          tertiary: AppColors.yellow_cdcc12,
          onSecondary: AppColors.black_opc10,
          shadow: AppColors.black_opc32,
        ),
      );
  //////////////////////////////////////////////////////////////////////////////
  static ThemeData getDarkModeTheme() => ThemeData(
        fontFamily: AppFonts.raleway,
    colorScheme: ColorScheme.dark(
      primaryFixed: AppColors.grey_343541,
      onPrimaryFixed: AppColors.white,
      primaryContainer: AppColors.white_opc8,
      surface: AppColors.green_10A37F,
      onSurface: AppColors.white_opc20,
      primary: AppColors.black_202123,
      outline: AppColors.white_opc40,
      onPrimary: AppColors.grey_343541,
      error: AppColors.red_ED8C8C,
      onError: AppColors.yellow_FBF3AD,
      tertiary: AppColors.yellow_887B06,
      onSecondary: AppColors.white_opc10,
      shadow: AppColors.white_opc32,
    ),
      );
}
