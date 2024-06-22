import 'package:flutter/material.dart';
extension MediaQueryValues on BuildContext {
  double get mw => MediaQuery.of(this).size.width;
  double get mh => MediaQuery.of(this).size.height;
}