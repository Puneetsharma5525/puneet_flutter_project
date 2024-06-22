import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/core/MediaQuery.dart';
import 'TextWidget.dart';

class Item extends StatelessWidget {
  final Color color;
  final String text;
  final GestureTapCallback? onTap;
  const Item(
      {super.key,
      required this.text,
      this.color = const Color(0xffffffff),
  this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: double.infinity,
        height: context.mh * 0.15,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: TextWidget(
            text: text,
          ),
        ),
      ),
    );
  }
}
