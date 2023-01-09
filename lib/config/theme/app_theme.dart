import 'package:flutter/material.dart';
import '../../core/resources/app_colors.dart';

class AppTheme {

  static ThemeData get light {
    return ThemeData(
      primaryColor: AppColors.appBar,
      primaryColorLight: AppColors.appBar,
      cardColor: AppColors.cardBackground,
      backgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.background,
      iconTheme: const IconThemeData(color: AppColors.iconColor),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: AppColors.appBar,
        shadowColor: AppColors.appBar,
        iconTheme: IconThemeData(color: AppColors.white),
      ),
    );
  }

}