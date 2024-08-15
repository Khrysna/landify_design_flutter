import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:landify_design_flutter/design_systems/components/assets/feature_better_components_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/feature_flexibility_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/feature_multiple_layout_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/feature_robust_workflow_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/feature_user_friendly_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/feature_well_organised_image.dart';
import 'package:landify_design_flutter/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/design_systems/colors/colors.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int featuresLength = 6;
    int columnSizes = 1;
    int rowSizes = featuresLength;

    if (breakpoint.equals(Breakpoint.desktop)) {
      columnSizes = 3;
      rowSizes = featuresLength ~/ columnSizes;
    } else if (breakpoint.largerThanLaptop) {
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

                final width = breakpoint.largerOrEqualToLaptop ? halfWidth : fullWidth;

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
                  icon: FeatureRobustWorkflowImage(),
                ),
                _FeatureItem(
                  title: 'Flexibility',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: FeatureFlexibilityImage(),
                ),
                _FeatureItem(
                  title: 'User friendly',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: FeatureUserFriendlyImage(),
                ),
                _FeatureItem(
                  title: 'Multiple layouts',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: FeatureMultipleLayoutsImage(),
                ),
                _FeatureItem(
                  title: 'Better components',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: FeatureBetterComponentsImage(),
                ),
                _FeatureItem(
                  title: 'Well organised',
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.',
                  icon: FeatureWellOrganisedImage(),
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

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
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