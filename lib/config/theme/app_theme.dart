import 'package:flutter/material.dart';
import '../../core/resources/app_colors.dart';

class AppTheme {

  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primary,
      cardColor: AppColors.cardBackground,
      backgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.background,
      hintColor: const Color(0x8a000000),
      errorColor: const Color(0xffd32f2f),
      iconTheme: const IconThemeData(color: AppColors.iconColor),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.primary,
        shadowColor: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: AppColors.textFieldColor,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          color: Color(0x8a000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline3: TextStyle(
          color: Color(0x8a000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline4: TextStyle(
          color: Color(0x8a000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline5: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle1: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText1: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        caption: TextStyle(
          color: Color(0x8a000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle2: TextStyle(
          color: Color(0xff000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        overline: TextStyle(
          color: Color(0xff000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

}