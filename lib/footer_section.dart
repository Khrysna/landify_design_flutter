import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    Widget content = const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Information(),
        SizedBox(height: 32),
        _GetApps(),
      ],
    );

    if (breakpoint.responsiveFromTablet) {
      content = const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _Information()),
          SizedBox(width: 32),
          Expanded(child: _GetApps()),
        ],
      );
    }

    return Container(
      color: Colors.black,
      child: MaxContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: content,
        ),
      ),
    );
  }
}

class _Information extends StatelessWidget {
  const _Information();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Assets.logoMini.image(height: 32, width: 32),
        const SizedBox(height: 24),
        const Wrap(
          runSpacing: 12,
          spacing: 24,
          children: [
            _Menu('Download Now'),
            _Menu('License'),
          ],
        ),
        const SizedBox(height: 12),
        const Wrap(
          runSpacing: 12,
          spacing: 24,
          children: [
            _Menu('About'),
            _Menu('Features'),
            _Menu('Pricing'),
            _Menu('News'),
            _Menu('Help'),
            _Menu('Contact'),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          '© 2021 Landify UI Kit. All rights reserved',
          style: AppTextStyles.bodySmallRegular.copyWith(color: ColorName.neutral300),
        ),
      ],
    );
  }
}

class _GetApps extends StatelessWidget {
  const _GetApps();

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;

    return Align(
      alignment: breakpoint.responsiveFromTablet ? Alignment.topRight : Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get the App',
            style: AppTextStyles.bodyLargeMedium.copyWith(color: ColorName.neutral300),
          ),
          const SizedBox(height: 16),
          Assets.googlePlay.image(height: 40),
          const SizedBox(height: 16),
          Assets.appStore.image(height: 40),
        ],
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: AppTextStyles.bodyMediumRegular.copyWith(color: Colors.white));
  }
}
