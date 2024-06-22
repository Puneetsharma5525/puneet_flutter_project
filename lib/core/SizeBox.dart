import 'package:flutter/material.dart';

extension Pad on dynamic {
  SizedBox get height => SizedBox(
    height: toDouble(),
  );
  SizedBox get width => SizedBox(
    width: toDouble(),
  );
}
