import 'package:flutter/material.dart';

class NFadeLabel extends StatelessWidget {
  const NFadeLabel({
    super.key,
    required this.child,
    required this.onPressed,
    this.duration = const Duration(milliseconds: 280),
    this.curve = Curves.easeOutCubic,
  });

  final Widget child;
  final VoidCallback onPressed;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: AnimatedSize(
        duration: duration,
        curve: curve,
        alignment: Alignment.centerLeft,
        child: AnimatedSwitcher(
          duration: duration,
          switchInCurve: curve,
          switchOutCurve: curve,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: child,
        ),
      ),
    );
  }
}
