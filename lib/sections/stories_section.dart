import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';
import 'package:landify_design_flutter/utils/colors.dart';

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    return Container(
      color: AppColors.secondary100,
      padding: const EdgeInsets.only(top: 64, bottom: 96),
      child: MaxContainer(
        child: Stack(
          children: [
            Assets.quote.image(height: 116),
            if (breakpoint.responsiveFromLaptop) ...{
              const Row(
                children: [
                  Expanded(child: _LeftSection()),
                  SizedBox(width: 32),
                  Expanded(child: _RightSection()),
                ],
              ),
            } else ...{
              const Column(
                children: [
                  _LeftSection(),
                  SizedBox(width: 32),
                  _RightSection(),
                ],
              )
            },
          ],
        ),
      ),
    );
  }
}

class _LeftSection extends StatelessWidget {
  const _LeftSection();

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    EdgeInsets padding = const EdgeInsets.only(top: 56, bottom: 32);
    double widthStoryContent = double.infinity;

    return LayoutBuilder(
      builder: (context, constraint) {
        if (breakpoint.responsiveFromLaptop) {
          padding = const EdgeInsets.only(top: 56, left: 104);
          widthStoryContent = constraint.maxWidth * 0.7;
        }

        return Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelWithDescription(
                title: 'Real Stories from Real Customers',
                subtitle: 'Get inspired by these stories.',
              ),
              const SizedBox(height: 64),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: widthStoryContent,
                  child: const _StoryItem(
                    icon: Assets.logoHubspot,
                    story:
                        'To quickly start my startup landing page design, I was looking for a landing page UI Kit. Landify is one of the best landing page UI kit I have come across. It’s so flexible, well organised and easily editable.',
                    personName: 'Floyd Miles',
                    position: 'Vice President',
                    company: 'GoPro',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RightSection extends StatelessWidget {
  const _RightSection();

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    double widthStoryContent1 = double.infinity;
    double widthStoryContent2 = double.infinity;

    return LayoutBuilder(
      builder: (context, constraint) {
        if (breakpoint.responsiveFromLaptop) {
          widthStoryContent1 = constraint.maxWidth * 0.9;
          widthStoryContent2 = constraint.maxWidth * 0.7;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: widthStoryContent1,
              child: const _StoryItem(
                icon: Assets.logoAirbnb,
                story:
                    'I used landify and created a landing page for my startup within a week. The Landify UI Kit is simple and highly intuitive, so anyone can use it.',
                personName: 'Jane Cooper',
                position: 'CEO',
                company: 'Airbnb',
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: widthStoryContent2,
              child: const _StoryItem(
                icon: Assets.logoStrapi,
                story: 'Landify saved our time in designing my company page.',
                personName: 'Kristin Watson',
                position: 'Co-Founder',
                company: 'Strapi',
              ),
            ),
          ],
        );
      },
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({
    required this.icon,
    required this.story,
    required this.personName,
    required this.position,
    required this.company,
  });

  final AssetGenImage icon;

  final String story;

  final String personName;

  final String position;

  final String company;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: -2,
            color: AppColors.neutral900.withOpacity(0.1),
          ),
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -2,
            color: AppColors.neutral900.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon.image(height: 32),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.quote2.image(height: 16),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story,
                      style: AppTextStyles.bodyLargeRegular.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      personName,
                      style: AppTextStyles.bodyLargeBold.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                    Text(
                      '$position, $company',
                      style: AppTextStyles.bodyMediumRegular.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
