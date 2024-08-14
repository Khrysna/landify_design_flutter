import 'package:flutter/material.dart';
import 'package:landify_design_flutter/main_notifier.dart';
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
import 'package:landify_design_flutter/utils/breakpoint.dart';
import 'package:landify_design_flutter/utils/constants.dart';
import 'package:landify_design_flutter/utils/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landify Design - Flutter',
      builder: (context, child) => LayoutBuilder(
        builder: (context, constraint) {
          return BreakpointProvider(
            breakpoint: Breakpoint.get(constraint.maxWidth),
            child: child!,
          );
        },
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
        ),
      ),
      home: Provider(
        notifier: MainNotifier(),
        child: const LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final notifier = Provider.of<MainNotifier>(context);
      notifier.onScrollOffsetChanged(_scrollController.offset);
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
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(Constants.kNavigationBarHeight),
          child: NavBar(),
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
