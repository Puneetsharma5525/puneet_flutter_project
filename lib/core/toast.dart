import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension FlutterTot on String {
  void toast() {
    Fluttertoast.showToast(
      msg: this,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}