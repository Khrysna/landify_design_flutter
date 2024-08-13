import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';
import 'package:landify_design_flutter/utils/constants.dart';
import 'package:landify_design_flutter/design_systems/typography/text_styles.dart';
import 'package:landify_design_flutter/gen/assets.gen.dart';
import 'package:landify_design_flutter/gen/colors.gen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = context.breakpoint;
    const navigation = ['Features', 'Pricing', 'Careers', 'Help'];

    final showNavigation = breakpoint.responsiveFromLaptop;
    final showStoreLogo = breakpoint.responsiveFromTablet;
    final showBarsIcon = !breakpoint.responsiveFromLaptop;

    return SizedBox(
      height: Constants.kNavigationBarHeight,
      child: Row(
        children: [
          Assets.logoWithText.image(height: 32),
          if (showNavigation) ...{
            const SizedBox(width: 32),
            ...List.generate(
              navigation.length,
              (index) => _NavigationItem(
                index: index,
                title: navigation[index],
              ),
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

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.index,
    required this.title,
  });

  final int index;

  final String title;

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          minimumSize: null,
          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 12)),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return ColorName.primary600;
              }

              return ColorName.neutral900;
            },
          ),
        ),
        child: Text(title, style: AppTextStyles.bodySmallSemiBold),
      ),
    );
  }
}
