import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/components/text_link_button.dart';
import 'package:landify_design_flutter/main.dart';
import 'package:landify_design_flutter/sections/achievements_section.dart';
import 'package:landify_design_flutter/utils/breakpoint_ext.dart';
import 'package:landify_design_flutter/utils/constants.dart';
import 'package:landify_design_flutter/utils/assets.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final popoverKey = UniqueKey();

  bool isShowing = false;

  final overlayPortalController = OverlayPortalController();

  final _link = LayerLink();

  void toggle() {
    overlayPortalController.toggle();

    if (isShowing != overlayPortalController.isShowing) {
      setState(() {
        isShowing = overlayPortalController.isShowing;
      });
    }
  }

  void hide() {
    if (isShowing) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        overlayPortalController.hide();

        setState(() {
          isShowing = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    if (breakpoint.largerThan(TABLET)) {
      hide();
    }

    return TapRegion(
      groupId: popoverKey,
      child: CompositedTransformTarget(
        link: _link,
        child: OverlayPortal(
          controller: overlayPortalController,
          overlayChildBuilder: (context) {
            return TapRegion(
              groupId: popoverKey,
              onTapOutside: (_) => hide(),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 80),
                  padding: const EdgeInsets.only(bottom: 24),
                  color: Colors.white,
                  width: double.infinity,
                  child: const _NavbarOverlay(),
                ),
              ),
            );
          },
          child: _Navbar(isShowing: isShowing, onPressed: toggle),
        ),
      ),
    );
  }
}

class _NavbarOverlay extends StatelessWidget {
  const _NavbarOverlay();

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);
    final showStores = breakpoint.equals(MOBILE);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const _Navigation(),
        if (showStores) ...{
          const _Apps(),
        },
      ],
    );
  }
}

class _Navbar extends StatelessWidget {
  const _Navbar({required this.isShowing, required this.onPressed});

  final bool isShowing;

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    final showNavigation = breakpoint.largerOrEqualTo(LAPTOP);
    final showStoreLogo = breakpoint.largerOrEqualTo(TABLET);
    final showBarsIcon = breakpoint.smallerOrEqualTo(TABLET);

    return ColoredBox(
      color: isShowing ? Colors.white : Colors.transparent,
      child: MaxContainer(
        child: SizedBox(
          height: Constants.kNavigationBarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.logoWithText.image(height: 32),
              if (showNavigation) ...{
                const SizedBox(width: 32),
                const _Navigation(),
              },
              if (showStoreLogo || showBarsIcon) ...{
                const Spacer(),
                if (showStoreLogo) ...{
                  const _Apps(),
                },
                if (showBarsIcon) ...{
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(isShowing ? Icons.close : Icons.menu, size: 24),
                  ),
                }
              },
            ],
          ),
        ),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation();

  @override
  Widget build(BuildContext context) {
    const navigation = ['Features', 'Pricing', 'Careers', 'Help'];
    final breakpoint = ResponsiveBreakpoints.of(context);

    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: Constants.paddingContainer - 12);

    if (breakpoint.largerOrEqualTo(LAPTOP)) {
      padding = EdgeInsets.zero;
    }

    return Padding(
      padding: padding,
      child: ResponsiveRowColumn(
        columnMainAxisSize: MainAxisSize.min,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        layout: breakpoint.getRowTypeWhenLargerOrEqualTo(LAPTOP),
        children: [
          ...List.generate(
            navigation.length,
            (index) => ResponsiveRowColumnItem(child: TextLinkButton.light(navigation[index])),
          ),
        ],
      ),
    );
  }
}

class _Apps extends StatelessWidget {
  const _Apps();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.googlePlay.image(height: 40),
        const SizedBox(width: 12),
        Assets.appStore.image(height: 40),
      ],
    );
  }
}
