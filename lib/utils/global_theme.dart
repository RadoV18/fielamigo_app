import 'package:flutter/material.dart';

const Color secondary = Color(0xff2e5cb2);
const Color primary = Color(0xff21c391);
const Color accent = Color(0xffff8e47);
const Color backgroundDark = Color(0xff084c61);
const Color backgroundLight = Color(0xffffffff);

const ColorScheme _customColorScheme = ColorScheme(
  background: backgroundLight,
  primary: primary,
  onPrimary: backgroundLight,
  secondary: secondary,
  onSecondary: backgroundLight,
  brightness: Brightness.light,
  error: Color(0xffff0000),
  onError: Color(0xffffffff),
  onBackground: Color(0xff000000),
  surface: primary,
  onSurface: backgroundLight,
);

class GlobalTheme {
  static final globalTheme = ThemeData(
    colorScheme: ColorScheme.light().copyWith(
      primary: primary,
      secondary: secondary
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Color.fromRGBO(255, 255, 255, 0.5),
      indicator: BoxDecoration(
        color: Color(0xff4b67a6),
      ),
    )
  );
}