import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:landify_design_flutter/design_systems/components/text_link_button.dart';
import 'package:landify_design_flutter/main.dart';
import 'package:landify_design_flutter/utils/constants.dart';
import 'package:landify_design_flutter/utils/assets.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);
    const navigation = ['Features', 'Pricing', 'Careers', 'Help'];

    final showNavigation = breakpoint.largerOrEqualTo(LAPTOP);
    final showStoreLogo = breakpoint.largerOrEqualTo(TABLET);
    final showBarsIcon = breakpoint.smallerOrEqualTo(TABLET);

    return SizedBox(
      height: Constants.kNavigationBarHeight,
      child: Row(
        children: [
          Assets.logoWithText.image(height: 32),
          if (showNavigation) ...{
            const SizedBox(width: 32),
            ...List.generate(
              navigation.length,
              (index) => TextLinkButton.light(navigation[index]),
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
