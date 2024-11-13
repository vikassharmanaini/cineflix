import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  theme() => ThemeData(
        scaffoldBackgroundColor: backgroundColor,
      );
  darkTheme() => ThemeData.dark();
  final primmaryBottonColor = const Color(0xFFf2AA4c);
  final secondryButtonColor = const Color(0xFF33363c);
  final backgroundColor = const Color(0xFF00040E);
  final activetextColor = Colors.black;
  final thememode = ThemeMode.dark;
  final center_focus_schadow = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.black,
        Colors.black54,
        Colors.black38,
        Colors.black54,
        Colors.black
      ]);
  inactiveTextStyle() => const TextStyle(
        color: Colors.white70,
        fontSize: 14,
      );
  //text theme
  TextStyle headlinetexttheme ()=>Theme.of(Get.context!)
      .textTheme
      .displaySmall!
      .merge(GoogleFonts.lato(fontWeight: FontWeight.bold));
}
