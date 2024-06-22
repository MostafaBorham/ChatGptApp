import 'package:chat_gpt_app/ui/resources/app_colors.dart';
import 'package:chat_gpt_app/ui/resources/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle? getThinStyle({
    double fontSize = 12,
    Color color = AppColors.white,
    String fontFamily = AppFonts.raleway,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w100,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle? getExtraLightStyle({
    double fontSize = 12,
    Color color = AppColors.white,
    String fontFamily = AppFonts.raleway,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w200,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle? getLightStyle({
    double fontSize = 12,
    Color color = AppColors.white,
    String fontFamily = AppFonts.raleway,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w300,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle? getRegularStyle({
    double fontSize = 12,
    Color color = AppColors.white,
    String fontFamily = AppFonts.raleway,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w400,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle? getMediumStyle({
    double fontSize = 12,
    Color color = AppColors.white,
    String fontFamily = AppFonts.raleway,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle? getSemiBoldStyle({
    double fontSize = 12,
    Color color = AppColors.white,
    String fontFamily = AppFonts.raleway,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w600,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle? getBoldStyle({
    double fontSize = 12,
    Color color = AppColors.white,
    String fontFamily = AppFonts.raleway,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w700,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle? getExtraBoldStyle({
    double fontSize = 12,
    Color color = AppColors.white,
    String fontFamily = AppFonts.raleway,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w800,
        color: color,
        fontFamily: fontFamily,
      );

  static TextStyle? getThickStyle({
    double fontSize = 12,
    Color color = AppColors.white,
    String fontFamily = AppFonts.raleway,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      TextStyle(
        fontSize: fontSize,
        decoration: textDecoration,
        fontWeight: FontWeight.w900,
        color: color,
        fontFamily: fontFamily,
      );
}
