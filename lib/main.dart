import 'package:flutter/material.dart';
import 'package:landify_design_flutter/companies_sections.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';
import 'package:landify_design_flutter/main_section.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: ColorName.primary600),
        useMaterial3: true,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: ColorName.primary600,
            minimumSize:  const Size(0, 56),
            textStyle: AppTextStyles.bodyMediumSemiBold,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            minimumSize: const Size(0, 56),
            textStyle: AppTextStyles.bodyMediumSemiBold,
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
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: MainSection()),
          SliverToBoxAdapter(child: CompaniesSections()),
        ],
      ),
    );
  }
}
