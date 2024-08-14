import 'package:flutter/material.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';
import 'package:landify_design_flutter/utils/constants.dart';

class MaxContainer extends StatelessWidget {
  const MaxContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    double paddingContainer = Constants.paddingContainer;

    if (breakpoint.equals(Breakpoint.desktop)) {
      paddingContainer = 0.0;
    }

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints(maxWidth: Constants.maxContainer),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingContainer),
          child: child,
        ),
      ),
    );
  }
}
