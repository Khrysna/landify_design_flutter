
import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/utils/assets.dart';

class CompaniesSections extends StatelessWidget {
  const CompaniesSections({super.key});

  @override
  Widget build(BuildContext context) {
    const companies = [
      Assets.logoAirbnb,
      Assets.logoHubspot,
      Assets.logoGoogle,
      Assets.logoMicrosoft,
      Assets.logoWalmart,
      Assets.logoFedex,
    ];

    return MaxContainer(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 64,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: companies.map((company) => company.image(height: 28)).toList(),
          ),
        ),
      ),
    );
  }
}
