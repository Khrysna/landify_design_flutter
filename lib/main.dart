import 'package:flutter/material.dart';
import 'package:landify_design_flutter/sections/achievements_section.dart';
import 'package:landify_design_flutter/sections/companies_sections.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/sections/features_section.dart';
import 'package:landify_design_flutter/sections/footer_section.dart';
import 'package:landify_design_flutter/sections/get_app_section.dart';
import 'package:landify_design_flutter/sections/integrations_section.dart';
import 'package:landify_design_flutter/sections/main_section.dart';
import 'package:landify_design_flutter/sections/stories_section.dart';
import 'package:landify_design_flutter/design_systems/colors/colors.dart';
import 'package:landify_design_flutter/shared/navigation_bar.dart';
import 'package:landify_design_flutter/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

const String LAPTOP = 'LAPTOP';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landify Design - Flutter',
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 640, name: MOBILE),
          const Breakpoint(start: 641, end: 1024, name: TABLET),
          const Breakpoint(start: 1025, end: 1280, name: LAPTOP),
          const Breakpoint(start: 1281, end: 1536, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary600),
          useMaterial3: true,
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary600,
              minimumSize: const Size(0, 56),
              textStyle: AppTextStyles.bodyMediumSemiBold,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              foregroundColor: Colors.white,
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size(0, 56),
              textStyle: AppTextStyles.bodyMediumSemiBold,
              foregroundColor: AppColors.primary600,
            ),
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();

  bool _isExceedNavbar = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final isExceedNavbar = _scrollController.offset > Constants.kNavigationBarHeight;

      if (_isExceedNavbar != isExceedNavbar) {
        setState(() => _isExceedNavbar = isExceedNavbar);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(Constants.kNavigationBarHeight),
          child: NavBar(isExceedNavbar: _isExceedNavbar),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: const Column(
            children: [
              MainSection(),
              CompaniesSections(),
              FeaturesSection(),
              StoriesSection(),
              AchievementsSection(),
              IntegrationsSection(),
              GetAppSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
