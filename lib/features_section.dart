import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;
    final features = _Feature.features();

    int columnSizes = 1;
    int rowSizes = features.length;

    if (breakpoint.responsiveFromDesktop) {
      columnSizes = 3;
      rowSizes = features.length ~/ columnSizes;
    } else if (breakpoint.responsiveFromLaptop) {
      columnSizes = 2;
      rowSizes = features.length ~/ columnSizes;
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

                final width = breakpoint.responsiveFromLaptop ? halfWidth : fullWidth;

                return Container(
                  width: width,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Tailor-made features',
                        style: AppTextStyles.displayMediumBold.copyWith(
                          color: ColorName.neutral900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Lorem ipsum is common placeholder text used to demonstrate the graphic elements of a document or visual presentation.',
                        style: AppTextStyles.bodyLargeRegular.copyWith(
                          color: ColorName.neutral900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 64),
                    ],
                  ),
                );
              },
            ),
            LayoutGrid(
              rowSizes: List.generate(rowSizes, (_) => auto),
              columnSizes: List.generate(columnSizes, (_) => auto),
              rowGap: 64,
              children: features.map((feature) {
                return _FeatureItem(
                  title: feature.title,
                  description: feature.description,
                  icon: feature.icon,
                );
              }).toList(),
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
              style: AppTextStyles.displaySmallBold.copyWith(color: ColorName.neutral900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTextStyles.bodyMediumRegular.copyWith(color: ColorName.neutral700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _Feature extends Equatable {
  const _Feature({
    required this.title,
    required this.description,
    required this.icon,
  });

  static List<_Feature> features() {
    const description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.';

    return [
      const _Feature(
        title: 'Robust workflow',
        description: description,
        icon: Assets.robustWorkflow,
      ),
      const _Feature(
        title: 'Flexibility',
        description: description,
        icon: Assets.flexibility,
      ),
      const _Feature(
        title: 'User friendly',
        description: description,
        icon: Assets.userFriendly,
      ),
      const _Feature(
        title: 'Multiple layouts',
        description: description,
        icon: Assets.multipleLayouts,
      ),
      const _Feature(
        title: 'Better components',
        description: description,
        icon: Assets.betterComponents,
      ),
      const _Feature(
        title: 'Well organised',
        description: description,
        icon: Assets.wellOrganised,
      ),
    ];
  }

  final String title;

  final String description;

  final AssetGenImage icon;

  @override
  List<Object?> get props => [title, description, icon];
}
