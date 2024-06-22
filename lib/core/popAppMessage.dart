import 'package:flutter/services.dart';
import 'package:flutter_bloc_project/core/toast.dart';

void exitApp({DateTime? currentBackPressTime, String? message}) {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
    currentBackPressTime = now;
    message?.toast ?? ''.toast;
    return;
  }else{
    SystemNavigator.pop();
  }
}
