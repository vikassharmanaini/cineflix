import 'package:cineflix/app/routes/app_pages.dart';
import 'package:cineflix/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final apptheme =  AppTheme();
    return GetMaterialApp(
      theme: apptheme.theme,
      darkTheme: apptheme.darktheme,
      themeMode: apptheme.thememode,
      getPages: AppPages().pages,
    );
  }
}