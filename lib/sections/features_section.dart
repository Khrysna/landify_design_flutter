import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:landify_design_flutter/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/main.dart';
import 'package:landify_design_flutter/utils/assets.dart';
import 'package:landify_design_flutter/design_systems/colors/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    int featuresLength = 6;
    int columnSizes = 1;
    int rowSizes = featuresLength;

    if (breakpoint.largerThan(DESKTOP)) {
      columnSizes = 3;
      rowSizes = featuresLength ~/ columnSizes;
    } else if (breakpoint.largerThan(LAPTOP)) {
      columnSizes = 2;
      rowSizes = featuresLength ~/ columnSizes;
    }

    return MaxContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 96),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraint) {
                final fullWidth = constraint.biggest.width;
                final halfWidth = fullWidth / 1.5;

                final width = breakpoint.largerThan(LAPTOP) ? halfWidth : fullWidth;

                return Container(
                  width: width,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 64),
                  child: const LabelWithDescription(
                    labelWithDescriptionAlign: LabelWithDescriptionAlign.center,
                    title: 'Tailor-made features',
                    subtitle:
                        'Lorem ipsum is common placeholder text used to demonstrate the graphic elements of a document or visual presentation.',
                  ),
                );
              },
            ),
            LayoutGrid(
              rowSizes: List.generate(rowSizes, (_) => auto),
              columnSizes: List.generate(columnSizes, (_) => auto),
              rowGap: 64,
              children: const [
                _FeatureItem(
                  title: 'Robust workflow',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: Assets.robustWorkflow,
                ),
                _FeatureItem(
                  title: 'Flexibility',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: Assets.flexibility,
                ),
                _FeatureItem(
                  title: 'User friendly',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: Assets.userFriendly,
                ),
                _FeatureItem(
                  title: 'Multiple layouts',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: Assets.multipleLayouts,
                ),
                _FeatureItem(
                  title: 'Better components',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: Assets.betterComponents,
                ),
                _FeatureItem(
                  title: 'Well organised',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: Assets.wellOrganised,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;

  final String description;

  final AssetGenImage icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon.image(height: 32),
            const SizedBox(height: 24),
            Text(
              title,
              style: AppTextStyles.displaySmallBold.copyWith(color: AppColors.neutral900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTextStyles.bodyMediumRegular.copyWith(color: AppColors.neutral700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}