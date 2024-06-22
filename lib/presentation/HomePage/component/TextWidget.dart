import 'package:flutter/material.dart';

import '../../../core/ResponsiveText.dart';

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: Colors.white),
      textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
    );
  }
}
