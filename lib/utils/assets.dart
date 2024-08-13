import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage appStore = AssetGenImage('assets/app_store.png');
  static const AssetGenImage betterComponents = AssetGenImage('assets/better_components.png');
  static const AssetGenImage countries = AssetGenImage('assets/countries.png');
  static const AssetGenImage flexibility = AssetGenImage('assets/flexibility.png');
  static const AssetGenImage googlePlay = AssetGenImage('assets/google_play.png');
  static const AssetGenImage integrations = AssetGenImage('assets/integrations.png');
  static const AssetGenImage logoAirbnb = AssetGenImage('assets/logo-airbnb.png');
  static const AssetGenImage logoFedex = AssetGenImage('assets/logo-fedex.png');
  static const AssetGenImage logoGoogle = AssetGenImage('assets/logo-google.png');
  static const AssetGenImage logoHubspot = AssetGenImage('assets/logo-hubspot.png');
  static const AssetGenImage logoMicrosoft = AssetGenImage('assets/logo-microsoft.png');
  static const AssetGenImage logoMini = AssetGenImage('assets/logo-mini.png');
  static const AssetGenImage logoStrapi = AssetGenImage('assets/logo-strapi.png');
  static const AssetGenImage logoWalmart = AssetGenImage('assets/logo-walmart.png');
  static const AssetGenImage logoWithText = AssetGenImage('assets/logo_with_text.png');
  static const AssetGenImage mainBackground = AssetGenImage('assets/main_background.png');
  static const AssetGenImage mockup = AssetGenImage('assets/mockup.png');
  static const AssetGenImage mockup2 = AssetGenImage('assets/mockup2.png');
  static const AssetGenImage multipleLayouts = AssetGenImage('assets/multiple_layouts.png');
  static const AssetGenImage play = AssetGenImage('assets/play.png');
  static const AssetGenImage quote = AssetGenImage('assets/quote.png');
  static const AssetGenImage quote2 = AssetGenImage('assets/quote2.png');
  static const AssetGenImage robustWorkflow = AssetGenImage('assets/robust_workflow.png');
  static const AssetGenImage screenshotMobile1 = AssetGenImage('assets/screenshot_mobile_1.png');
  static const AssetGenImage userFriendly = AssetGenImage('assets/user_friendly.png');
  static const AssetGenImage wellOrganised = AssetGenImage('assets/well_organised.png');
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({Key? key, double? width, double? height, BoxFit? fit}) {
    return Image.asset(_assetName, key: key, width: width, height: height, fit: fit);
  }
}
