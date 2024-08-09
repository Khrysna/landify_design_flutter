import 'package:flutter/material.dart';

class MaxContainer extends StatelessWidget {
  const MaxContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1216),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: child,
        ),
      ),
    );
  }
}
