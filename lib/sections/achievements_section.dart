import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:landify_design_flutter/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/main.dart';
import 'package:landify_design_flutter/utils/assets.dart';
import 'package:landify_design_flutter/utils/breakpoint_ext.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    return MaxContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: ResponsiveRowColumn(
          layout: breakpoint.getRowTypeWhenLargerOrEqualTo(LAPTOP),
          rowSpacing: 32,
          columnSpacing: 48,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ResponsiveRowColumnItem(rowFit: FlexFit.tight, child: _LabelWithDescription()),
            ResponsiveRowColumnItem(rowFit: FlexFit.tight, child: _Achievements()),
          ],
        ),
      ),
    );
  }
}

class _LabelWithDescription extends StatelessWidget {
  const _LabelWithDescription();

  @override
  Widget build(BuildContext context) {
    return const LabelWithDescription(
      title: 'Our 18 years of achievements',
      subtitle: 'With our super powers we have reached this',
    );
  }
}

class _Achievements extends StatelessWidget {
  const _Achievements();

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    int rowSizes = 4;
    int columnSizes = 1;

    if (breakpoint.largerOrEqualTo(TABLET)) {
      rowSizes = 2;
      columnSizes = 2;
    }

    return LayoutGrid(
      rowSizes: List.generate(rowSizes, (_) => auto),
      columnSizes: List.generate(columnSizes, (_) => auto),
      rowGap: 40,
      columnGap: 32,
      children: const [
        _AchievementItem(
          icon: Assets.robustWorkflow,
          title: '10,000+',
          subtitle: 'Downloads per day',
        ),
        _AchievementItem(
          icon: Assets.multipleLayouts,
          title: '2 Million',
          subtitle: 'Users',
        ),
        _AchievementItem(
          icon: Assets.betterComponents,
          title: '500+',
          subtitle: 'Clients',
        ),
        _AchievementItem(
          icon: Assets.countries,
          title: '140',
          subtitle: 'Countries',
        ),
      ],
    );
  }
}

class _AchievementItem extends StatelessWidget {
  const _AchievementItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final AssetGenImage icon;

  final String title;

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon.image(height: 32),
        const SizedBox(width: 16),
        Expanded(
          child: LabelWithDescription(
            title: title,
            subtitle: subtitle,
            labelWithDescriptionType: LabelWithDescriptionType.small,
          ),
        ),
      ],
    );
  }
}
