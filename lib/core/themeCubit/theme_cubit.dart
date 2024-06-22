import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/core/theme.dart';
import 'package:flutter_bloc_project/core/themeCubit/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(super.initialState);
  final String _themeKey = 'is_dark';

  ThemeData _themeData = ThemeData();
  ThemeData getTheme() => _themeData;
  Future<ThemeState> getInitialState() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.get(_themeKey) == true) {
      _themeData = darkTheme;
      return DarkThemeState(darkTheme);
    } else {
      _themeData = lightTheme;
      return LightThemeState(lightTheme);
    }
  }
  Future<bool> getBool() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.get(_themeKey) == true) {
      return true;
    } else {
      return false;
    }
  }

  void updateTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    if (isDark) {
      _themeData = darkTheme;
      prefs.setBool(_themeKey, isDark);
      emit(DarkThemeState(darkTheme));
    } else {
      _themeData = lightTheme;
      prefs.setBool(_themeKey, isDark);
      emit(LightThemeState(lightTheme));
    }
  }

  static final ThemeData darkTheme = ThemeModes().dark;
  static final ThemeData lightTheme =  ThemeModes().light;
}
