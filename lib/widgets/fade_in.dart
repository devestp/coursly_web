import 'package:flutter/material.dart';

enum FadeInDirection {
  up,
  down,
}

class FadeIn extends StatelessWidget {
  final Widget child;
  final FadeInDirection fadeInDirection;

  const FadeIn({
    required this.child,
    this.fadeInDirection = FadeInDirection.up,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 400);
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: duration,
      builder: ((_, double value, __) {
        return AnimatedOpacity(
          opacity: value,
          duration: duration,
          child: child,
        );
      }),
    );
  }
}
