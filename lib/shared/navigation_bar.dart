import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/max_container.dart';
import 'package:landify_design_flutter/design_systems/components/responsive_row_column.dart';
import 'package:landify_design_flutter/design_systems/components/text_link_button.dart';
import 'package:landify_design_flutter/main_notifier.dart';
import 'package:landify_design_flutter/utils/breakpoint.dart';
import 'package:landify_design_flutter/utils/constants.dart';
import 'package:landify_design_flutter/utils/assets.dart';
import 'package:landify_design_flutter/utils/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final popoverKey = UniqueKey();

  bool isShowing = false;

  final overlayPortalController = OverlayPortalController();

  bool isColorTransparent(bool isExceedNavbar) {
    if (isExceedNavbar) {
      return false;
    }

    return !isShowing;
  }

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
    final notifier = Provider.of<MainNotifier>(context);
    final breakpoint = BreakpointProvider.of(context);

    if (breakpoint.largerThanTablet) {
      hide();
    }

    return TapRegion(
      groupId: popoverKey,
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
        child: _Navbar(
          isShowing: isShowing,
          isColorTransparent: isColorTransparent(notifier.value),
          onPressed: toggle,
        ),
      ),
    );
  }
}

class _NavbarOverlay extends StatelessWidget {
  const _NavbarOverlay();

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    final showStores = breakpoint.equals(Breakpoint.mobile);

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
  const _Navbar({
    required this.isShowing,
    required this.isColorTransparent,
    required this.onPressed,
  });

  final bool isShowing;

  final bool isColorTransparent;

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    final showNavigation = breakpoint.largerThanLaptop;
    final showStoreLogo = breakpoint.largerOrEqualToTablet;
    final showBarsIcon = breakpoint.smallerOrEqualToTablet;

    return ColoredBox(
      color: isColorTransparent ? Colors.transparent : Colors.white,
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
    final breakpoint = BreakpointProvider.of(context);

    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: Constants.paddingContainer - 12);

    if (breakpoint.largerOrEqualToLaptop) {
      padding = EdgeInsets.zero;
    }

    return Padding(
      padding: padding,
      child: ResponsiveRowColumn(
        columnMainAxisSize: MainAxisSize.min,
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
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
