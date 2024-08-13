import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';

class IntegrationsSection extends StatelessWidget {
  const IntegrationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Description(),
        const SizedBox(height: 48),
        Center(child: Assets.integrations.image()),
      ],
    );

    if (breakpoint.responsiveFromTablet) {
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 4, child: _Description()),
          const SizedBox(width: 32),
          Expanded(flex: 6, child: AspectRatio(aspectRatio: 3, child: Assets.integrations.image())),
        ],
      );
    }

    return MaxContainer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: content,
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    TextStyle titleStyle = AppTextStyles.displaySmallBold;
    TextStyle subtitleStyle = AppTextStyles.bodyMediumRegular;

    if (breakpoint.responsiveFromLaptop) {
      titleStyle = AppTextStyles.displayLargeBold;
      subtitleStyle = AppTextStyles.bodyLargeRegular;
    } else if (breakpoint.responsiveFromTablet) {
      titleStyle = AppTextStyles.displayMediumBold;
      subtitleStyle = AppTextStyles.bodyLargeRegular;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Easy integrations with 170+ tools',
          style: titleStyle.copyWith(color: ColorName.neutral900),
        ),
        const SizedBox(height: 8),
        Text(
          'Connect Landify with your favourite tools that you use daily and keep things on track.',
          style: subtitleStyle.copyWith(color: ColorName.neutral900),
        ),
      ],
    );
  }
}
