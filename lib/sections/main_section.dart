import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/label_with_description.dart';
import 'package:landify_design_flutter/main.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/utils/constants.dart';
import 'package:landify_design_flutter/utils/assets.dart';
import 'package:landify_design_flutter/utils/breakpoint_ext.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _Background(),
        MaxContainer(child: MainContent()),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Assets.mainBackground.image(width: double.infinity, fit: BoxFit.fill, height: height);
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: ResponsiveRowColumn(
        layout: breakpoint.getRowTypeWhenLargerOrEqualTo(LAPTOP),
        columnSpacing: 72,
        children: const [
          ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelWithDescription(
                  title: 'The easiest way to manage projects',
                  subtitle:
                      'From the small stuff to the big picture, organizes the work so teams know what to do, why it matters, and how to get it done.',
                  labelWithDescriptionType: LabelWithDescriptionType.heading,
                ),
                SizedBox(height: 32),
                _InstructionButtons(),
              ],
            ),
          ),
          ResponsiveRowColumnItem(rowFit: FlexFit.tight, child: _Screenshot()),
        ],
      ),
    );
  }
}

class _Screenshot extends StatelessWidget {
  const _Screenshot();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    const navbarHeight = Constants.kNavigationBarHeight;
    const paddingVerticalContent = 72 * 2;

    final screenshotHeight = screenHeight - navbarHeight - paddingVerticalContent;

    return Assets.screenshotMobile1.image(height: screenshotHeight);
  }
}

class _InstructionButtons extends StatelessWidget {
  const _InstructionButtons();

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);
    final isMobile = breakpoint.equals(MOBILE);

    return ResponsiveRowColumn(
      rowSpacing: 16,
      columnSpacing: 8,
      layout: breakpoint.getRowTypeWhenLargerOrEqualTo(TABLET),
      children: [
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: isMobile ? double.infinity : null,
            child: SelectionContainer.disabled(
              child: FilledButton(
                onPressed: () {},
                child: const Text('Get Started'),
              ),
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: isMobile ? double.infinity : null,
            child: SelectionContainer.disabled(
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.play.image(width: 24, height: 24),
                    const SizedBox(width: 8),
                    const Text('Watch Video'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
