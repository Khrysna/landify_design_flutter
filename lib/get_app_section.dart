import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';

class GetAppSection extends StatelessWidget {
  const GetAppSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    Widget content = const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Description(),
        _Screenshots(),
      ],
    );

    if (breakpoint.responsiveFromLaptop) {
      content = const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _Description()),
          SizedBox(width: 32),
          Expanded(child: _Screenshots()),
        ],
      );
    }

    return Container(
      color: ColorName.secondary600,
      child: MaxContainer(
        child: Container(
          width: double.infinity,
          child: content,
        ),
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Manage all projects from your mobile',
            style: titleStyle.copyWith(color: ColorName.neutral900),
          ),
          const SizedBox(height: 8),
          Text(
            'Download the app to manage your projects, keep track of the progress and complete tasks without procastinating. Stay on track and complete on time!',
            style: subtitleStyle.copyWith(color: ColorName.neutral900),
          ),
          const SizedBox(height: 48),
          Text(
            'Get the App',
            style: AppTextStyles.bodyLargeMedium.copyWith(
              color: ColorName.neutral900,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Assets.googlePlay.image(height: 40),
              const SizedBox(width: 12),
              Assets.appStore.image(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _Screenshots extends StatelessWidget {
  const _Screenshots();

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    if (breakpoint.responsiveFromTablet) {
      return IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Assets.mockup2.image(),
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 160),
                  child: Assets.mockup.image(),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Column(
        children: [
          Assets.mockup2.image(),
          Assets.mockup.image(),
        ],
      ),
    );
  }
}
