import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            "MovieFlix",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        );
      },
      animation: slidingAnimation,
    );
  }
}
