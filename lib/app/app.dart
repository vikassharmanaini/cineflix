import 'package:cineflix/app/app_bindings.dart';
import 'package:cineflix/app/routes/app_pages.dart';
import 'package:cineflix/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reown_appkit/modal/theme/public/appkit_modal_theme.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final apptheme =  AppTheme();
    return      ReownAppKitModalTheme(
                            isDarkMode: true,
                            themeData: ReownAppKitModalThemeData(
  lightColors: ReownAppKitModalColors.lightMode.copyWith(
    accent100: Colors.red,
    background125: Colors.yellow.shade300,
  ),
  darkColors: ReownAppKitModalColors.darkMode.copyWith(
    accent100: Colors.green,
    background125: Colors.black,
  ),
),
      child: GetMaterialApp(
        initialBinding: AppBindings(),
        theme: apptheme.theme,
        darkTheme: apptheme.darktheme,
        themeMode: apptheme.thememode,
        getPages: AppPages().pages,
      ),
    );
  }
}