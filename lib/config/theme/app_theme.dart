import 'package:flutter/material.dart';
import '../../core/resources/color_manager.dart';

class AppTheme {

  static ThemeData get light {
    return ThemeData(
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primary,
      cardColor: ColorManager.cardBackground,
      backgroundColor: ColorManager.white,
      scaffoldBackgroundColor: ColorManager.background,
      hintColor: const Color(0x8a000000),
      iconTheme: const IconThemeData(color: ColorManager.iconColor),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: ColorManager.primary,
        shadowColor: ColorManager.primary,
        iconTheme: IconThemeData(
            color: ColorManager.white,
            size: 35
        ),
        titleTextStyle: TextStyle(
          color: ColorManager.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        )
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        minWidth: 88,
        height: 36,
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff000000),
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: ColorManager.headlineText,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
        headline2: TextStyle(
          color: Color(0x8a000000),
          fontSize: 20,
          fontWeight: FontWeight.bold,
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
          fontSize: 20,
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