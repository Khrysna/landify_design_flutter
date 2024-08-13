import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';

enum LabelWithDescriptionAlign { start, center }

class LabelWithDescription extends StatelessWidget {
  const LabelWithDescription({
    super.key,
    required this.title,
    required this.subtitle,
    this.labelWithDescriptionAlign = LabelWithDescriptionAlign.start,
  });

  final String title;

  final String subtitle;

  final LabelWithDescriptionAlign labelWithDescriptionAlign;

  CrossAxisAlignment get crossAxisAlignment {
    if (labelWithDescriptionAlign == LabelWithDescriptionAlign.start) {
      return CrossAxisAlignment.start;
    }

    return CrossAxisAlignment.center;
  }

  TextAlign get textAlign {
    if (labelWithDescriptionAlign == LabelWithDescriptionAlign.start) {
      return TextAlign.start;
    }

    return TextAlign.center;
  }

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
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title, style: titleStyle.copyWith(color: ColorName.neutral900), textAlign: textAlign),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: subtitleStyle.copyWith(color: ColorName.neutral900),
          textAlign: textAlign,
        ),
      ],
    );
  }
}
