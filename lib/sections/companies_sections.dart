import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/assets/logo_airbnb_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/logo_fedex_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/logo_google_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/logo_hubspot_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/logo_microsoft_image.dart';
import 'package:landify_design_flutter/design_systems/components/assets/logo_walmart_image.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';

class CompaniesSections extends StatelessWidget {
  const CompaniesSections({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxContainer(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Wrap(
            spacing: 64,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              LogoAirbnbImage(),
              LogoHubspotImage(),
              LogoGoogleImage(),
              LogoMicrosoftImage(),
              LogoWalmartImage(),
              LogoFedexImage(),
            ],
          ),
        ),
      ),
    );
  }
}
