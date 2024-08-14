import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/utils/assets.dart';
import 'package:landify_design_flutter/utils/breakpoint_ext.dart';
import 'package:responsive_framework/responsive_framework.dart';

class IntegrationsSection extends StatelessWidget {
  const IntegrationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    double aspectRatio = 2;

    if (breakpoint.largerOrEqualTo(TABLET)) {
      aspectRatio = 3;
    }

    return MaxContainer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: ResponsiveRowColumn(
          layout: breakpoint.getRowTypeWhenLargerOrEqualTo(TABLET),
          rowSpacing: 32,
          columnSpacing: 48,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              rowFlex: 4,
              child: _Description(),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              rowFlex: 6,
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: Assets.integrations.image(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const LabelWithDescription(
      title: 'Easy integrations with 170+ tools',
      subtitle:
          'Connect Landify with your favourite tools that you use daily and keep things on track.',
    );
  }
}
