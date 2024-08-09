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
    return Scaffold(
      body: Stack(
        children: [
          Assets.mainBackground.image(
            height: MediaQuery.sizeOf(context).height,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const MaxContainer(
            child: NavigationBar(),
          ),
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

    final showNavigation = responsive.responsiveFromDesktop;
    final showStoreLogo = responsive.responsiveFromTablet;
    final showBarsIcon = !responsive.responsiveFromDesktop;

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
