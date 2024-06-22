import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  final Widget? child;
  const NoInternetScreen({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: child ??
            Image.asset(
              "packages/internet_handler/assets/no-internet.png",
              width: 400,
              height: 400,
            ),
      ),
    );
  }
}
