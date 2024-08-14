import 'package:flutter/material.dart';
import 'package:landify_design_flutter/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MaxContainer extends StatelessWidget {
  const MaxContainer({super.key, required this.child, this.background});

  final Widget? background;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);
    double paddingContainer = Constants.paddingContainer;

    if (breakpoint.largerThan(DESKTOP)) {
      paddingContainer = 0.0;
    }

    return MaxWidthBox(
      background: background,
      maxWidth: Constants.maxContainer,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingContainer),
        child: child,
      ),
    );
  }
}
