import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:landify_design_flutter/components/max_container.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
import 'package:landify_design_flutter/responsive_enum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Pagess'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
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
                        NavigationBar(),
                        MainContent(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  Widget _buildTitle(ResponsiveEnum responsive) {
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
    final responsive = context.responsive;

    final isMobile = responsive.responsiveOnlyMobile;
    final isRow = responsive.responsiveFromLaptop;

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
        _buildTitle(responsive),
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

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    final showNavigation = responsive.responsiveFromLaptop;
    final showStoreLogo = responsive.responsiveFromTablet;
    final showBarsIcon = !responsive.responsiveFromLaptop;

    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Assets.logoWithText.image(height: 32),
          const SizedBox(width: 32),
          if (showNavigation) ...{
            ...List.generate(
              4,
              (index) {
                final text = Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    ['Features', 'Pricing', 'Careers', 'Help'][index],
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xff111827),
                      fontWeight: FontWeight.w600,
                      height: 20 / 14,
                    ),
                  ),
                );

                if (index < 3) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: text,
                  );
                }

                return text;
              },
            ),
          },
          if (showStoreLogo || showBarsIcon) ...{
            const Spacer(),
            if (showStoreLogo) ...{
              Assets.googlePlay.image(height: 40),
              const SizedBox(width: 12),
              Assets.appStore.image(height: 40),
            },
            if (showBarsIcon) ...{
              const SizedBox(width: 16),
              const Icon(FontAwesomeIcons.bars, size: 24),
            }
          },
        ],
      ),
    );
  }
}
