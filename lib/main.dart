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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landify Design - Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary600),
        useMaterial3: true,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary600,
            minimumSize:  const Size(0, 56),
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
        )
      ),
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
  @override
  Widget build(BuildContext context) {
    return const SelectionArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: MainSection()),
            SliverToBoxAdapter(child: CompaniesSections()),
            SliverToBoxAdapter(child: FeaturesSection()),
            SliverToBoxAdapter(child: StoriesSection()),
            SliverToBoxAdapter(child: AchievementsSection()),
            SliverToBoxAdapter(child: IntegrationsSection()),
            SliverToBoxAdapter(child: GetAppSection()),
            SliverToBoxAdapter(child: FooterSection()),
          ],
        ),
      ),
    );
  }
}
