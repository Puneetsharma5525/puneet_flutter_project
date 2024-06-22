// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';
//
// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;
//
//   FadeAnimation(this.delay, this.child);
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return PlayAnimationBuilder(
//       delay: Duration(milliseconds: (300000 * delay).round()),
//       duration: const Duration(seconds: 5),
//       tween: Tween(begin: 1.0, end: 7.0),
//       child: child,
//       builder: (context, animation, child) => Opacity(
//         opacity: 0.9,
//         child: Transform.translate(
//           offset: Offset(0,20),
//           child: child
//         ),
//       ),
//     );
//   }
// }