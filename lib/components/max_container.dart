import 'package:flutter/material.dart';
import 'package:landify_design_flutter/breakpoint.dart';
import 'package:landify_design_flutter/configs/constants.dart';

class MaxContainer extends StatelessWidget {
  const MaxContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;
    double paddingContainer = Constants.paddingContainer;

    if (breakpoint.responsiveFromDesktop) {
      paddingContainer = 0.0;
    }

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: Constants.maxContainer),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingContainer),
          child: child,
        ),
      ),
    );
  }
}
