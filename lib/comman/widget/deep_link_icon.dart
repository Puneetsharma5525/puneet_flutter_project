import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_project/core/logger.dart';

class DeepLinkIcon extends StatelessWidget {
  final String? page;
  const DeepLinkIcon({super.key, this.page});

  @override
  Widget build(BuildContext context) {
    String deepLink = 'https://puneet-project.app/?page=$page';
    return IconButton(
      onPressed: () {
        Clipboard.setData(ClipboardData(text: deepLink)).then((value) {
          'Page Link Copy s'.toast;
        },);
      },
      icon: const Icon(Icons.link),
    );
  }
}
