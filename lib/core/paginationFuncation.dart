import 'package:flutter/material.dart';

paginationFunction(
    {required Function() fun, required ScrollController controller}) {
  controller.addListener(
    () {
      if (controller.position.maxScrollExtent == controller.offset) {
        fun.call();
      }
    },
  );
}
