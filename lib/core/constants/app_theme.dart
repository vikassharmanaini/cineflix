import 'package:cineflix/resources/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
   get theme=> ThemeData(
    primaryColorDark: AppColors().indicator,
    primaryColor:AppColors().indicator ,
    // colorSchemeSeed: AppColors().indicator
   );
   get darktheme =>ThemeData.dark();
   get thememode =>ThemeMode.dark;
}