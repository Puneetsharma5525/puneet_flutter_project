import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModes {
  final dark = ThemeData.dark(useMaterial3: true).copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    primaryTextTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
  );

  final light = ThemeData.light(useMaterial3: true).copyWith(
    // primaryColor: Colors.white,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    primaryTextTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
  );




}






















get darkMainColor => const Color(0xff14212b);

/// [light_theme]
get lightMainColor => const Color(0xffbc55fd);
get lightDeemColor => const Color(0xff9d69c3);

extension ThemeExtension on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }

  Color get primaryColor {
    return Theme.of(this).primaryColor;
  }
}

Color get white => const Color(0xffffffff);
Color get black => const Color(0xff000000);

// get fadeWhite => const Color(0xff8999a7);
get mainColor => const Color(0xff11161e);
Color cardColor(BuildContext context) {
  return _themeColor(
    context: context,
    lightColor: white,
    darkColor: darkMainColor,
  );
}

Color deemColor(
  BuildContext context, {
  Color lightColor = const Color(0xff9d69c3),
  Color darkColor = const Color(0xff8999a7),
}) {
  return _themeColor(
    context: context,
    lightColor: lightDeemColor,
    darkColor: const Color(0xff8999a7),
  );
}

Color _themeColor(
    {required BuildContext context,
    required Color lightColor,
    required Color darkColor}) {
  if (context.theme.brightness == Brightness.dark) {
    return darkColor;
  } else {
    return lightColor;
  }
}
