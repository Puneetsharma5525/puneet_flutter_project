import 'package:flutter/material.dart';

 class ThemeState {}

class DarkThemeState extends ThemeState {
  final ThemeData themeData;

  DarkThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  final ThemeData themeData;

  LightThemeState(this.themeData);
}
