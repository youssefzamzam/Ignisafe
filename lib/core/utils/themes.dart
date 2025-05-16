import 'package:flutter/material.dart';
import 'package:ignisafe/core/utils/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Projectfont',

  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.containerColor,
  textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Projectfont')),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    titleTextStyle: TextStyle(color: AppColors.darkGreyTxtColor, fontFamily: 'Projectfont'),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Projectfont',
  primaryColor: AppColors.primaryColor,
  textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Projectfont')),
  primaryColorDark: AppColors.scaffoldDarkColor,
  scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
  useMaterial3: true,
);

