import 'package:flutter/material.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/utils/constants.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';
import 'package:landify_design_flutter/shared/navigation_bar.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Stack(
      children: [
        Assets.mainBackground.image(
          height: height,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        const MaxContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBar(),
                MainContent(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;
    final isRow = breakpoint.responsiveFromLaptop;

    const instruction = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(),
        SizedBox(height: 16),
        _Description(),
        SizedBox(height: 32),
        _InstructionButtons(),
      ],
    );

    if (isRow) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 72),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: instruction),
            Expanded(child: _Screenshot()),
          ],
        ),
      );
    }

    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 72),
      child: Column(
        children: [
          instruction,
          Padding(padding: EdgeInsets.only(top: 72), child: _Screenshot()),
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

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;
    TextStyle titleStyle = AppTextStyles.displayMediumBold;

    if (breakpoint.responsiveFromLaptop) {
      titleStyle = AppTextStyles.displayExtraLargeBold;
    } else if (breakpoint.responsiveFromTablet) {
      titleStyle = AppTextStyles.displayLargeBold;
    }

    return Text(
      'The easiest way to manage projects',
      style: titleStyle.copyWith(color: ColorName.neutral900),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return Text(
      'From the small stuff to the big picture, organizes the work so teams know what to do, why it matters, and how to get it done.',
      style: AppTextStyles.bodyLargeRegular.copyWith(
        color: ColorName.neutral700,
      ),
    );
  }
}

class _InstructionButtons extends StatelessWidget {
  const _InstructionButtons();

  @override
  Widget build(BuildContext context) {
    final isMobile = context.breakpoint.isMobile;

    if (isMobile) {
      return const Column(
        children: [
          SizedBox(width: double.infinity, child: _GetStartedButton()),
          SizedBox(height: 8),
          SizedBox(width: double.infinity, child: _WatchVideoButton()),
        ],
      );
    }

    return const Row(
      children: [
        _GetStartedButton(),
        SizedBox(width: 16),
        _WatchVideoButton(),
      ],
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: const Text('Get Started'),
    );
  }
}

class _WatchVideoButton extends StatelessWidget {
  const _WatchVideoButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.play.image(width: 24, height: 24),
          const SizedBox(width: 8),
          const Text('Watch Video'),
        ],
      ),
    );
  }
}
