import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landify_design_flutter/breakpoint.dart';
import 'package:landify_design_flutter/components/max_container.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
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

  Widget _buildTitle(Breakpoint responsive) {
    double fontSize = 36.0;
    double lineHeight = 45.0;

    if (responsive.responsiveFromLaptop) {
      fontSize = 48.0;
      lineHeight = 60.0;
    } else if (responsive.responsiveFromTablet) {
      fontSize = 60.0;
      lineHeight = 72.0;
    }

    return Text(
      'The easiest way to manage projects',
      style: GoogleFonts.inter(
        fontSize: fontSize,
        color: const Color(0xff111827),
        fontWeight: FontWeight.bold,
        height: lineHeight / fontSize,
        letterSpacing: -2.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final height = size.height;
    final breakpoint = context.breakpoint;

    final isMobile = breakpoint.responsiveOnlyMobile;
    final isRow = breakpoint.responsiveFromLaptop;

    final getStartedButton = FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF7C3AED),
        minimumSize: isMobile ? const Size(double.infinity, 56) : const Size(0, 56),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          color: Colors.white,
          height: 24 / 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text('Get Started'),
    );

    final watchVideoButton = TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: isMobile ? const Size(double.infinity, 56) : const Size(0, 56),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          color: const Color(0xFF7C3AED),
          height: 24 / 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.play.image(width: 24, height: 24),
          const SizedBox(width: 8),
          const Text('Watch Video'),
        ],
      ),
    );

    final instruction = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(breakpoint),
        const SizedBox(height: 16),
        Text(
          'From the small stuff to the big picture, organizes the work so teams know what to do, why it matters, and how to get it done.',
          style: GoogleFonts.inter(
            fontSize: 18,
            color: const Color(0xff374151),
            height: 28 / 18,
          ),
        ),
        const SizedBox(height: 32),
        if (isMobile) ...{
          Column(
            children: [
              getStartedButton,
              const SizedBox(height: 8),
              watchVideoButton,
            ],
          ),
        } else ...{
          Row(
            children: [
              getStartedButton,
              const SizedBox(width: 16),
              watchVideoButton,
            ],
          ),
        },
      ],
    );

    final screenshot = Assets.screenshotMobile1.image(
      height: height - 80 - (72 * 2),
    );

    if (isRow) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 72),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: instruction),
            Expanded(child: screenshot),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: Column(
        children: [
          instruction,
          Padding(padding: const EdgeInsets.only(top: 72), child: screenshot),
        ],
      ),
    );
  }
}
