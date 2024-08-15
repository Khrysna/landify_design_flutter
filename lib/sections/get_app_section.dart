import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/assets/app_store_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/google_play_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/screenshot_mobile_2.dart';
import 'package:landify_design_flutter/design_systems/components/assets/screenshot_mobile_3.dart';
import 'package:landify_design_flutter/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/components/responsive_row_column.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/design_systems/colors/colors.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';

class GetAppSection extends StatelessWidget {
  const GetAppSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Container(
      width: double.infinity,
      color: AppColors.secondary600,
      child: MaxContainer(
        child: SizedBox(
          width: double.infinity,
          child: ResponsiveRowColumn(
            layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
            rowSpacing: 32,
            children: const [
              ResponsiveRowColumnItem(rowFit: FlexFit.tight, child: _Description()),
              ResponsiveRowColumnItem(rowFit: FlexFit.tight, child: _Screenshots()),
            ],
          ),
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelWithDescription(
            title: 'Manage all projects from your mobile',
            subtitle:
                'Download the app to manage your projects, keep track of the progress and complete tasks without procastinating. Stay on track and complete on time!',
          ),
          const SizedBox(height: 48),
          Text(
            'Get the App',
            style: AppTextStyles.bodyLargeMedium.copyWith(
              color: AppColors.neutral900,
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              GooglePlayImage(),
              SizedBox(width: 12),
              AppStoreImage(),
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
    final breakpoint = BreakpointProvider.of(context);

    if (breakpoint.largerOrEqualToTablet) {
      return const IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: AspectRatio(aspectRatio: 0.5, child: ScreenshotMobile3()),
              ),
            ),
            SizedBox(width: 32),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 160),
                  child: AspectRatio(aspectRatio: 0.5, child: ScreenshotMobile2()),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const Center(child: Column(children: [ScreenshotMobile3(), ScreenshotMobile2()]));
  }
}
