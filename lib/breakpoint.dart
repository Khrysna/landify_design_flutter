import 'package:flutter/cupertino.dart';

extension BreakpointExt on BuildContext {
  Breakpoint get responsive {
    final width = MediaQuery.sizeOf(this).width;

    if (width > 1536) {
      return Breakpoint.nextLevelDesktop;
    } else if (width > 1280) {
      return Breakpoint.desktop;
    } else if (width > 1024) {
      return Breakpoint.laptop;
    } else if (width > 640) {
      return Breakpoint.tablet;
    }

    return Breakpoint.mobile;
  }
}

enum Breakpoint {
  mobile,
  tablet,
  laptop,
  desktop,
  nextLevelDesktop;

  bool get responsiveOnlyMobile {
    return this == Breakpoint.mobile;
  }

  bool get responsiveFromMobile {
    return this == Breakpoint.mobile || responsiveFromTablet;
  }

  bool get responsiveFromTablet {
    return this == Breakpoint.tablet || responsiveFromLaptop;
  }

  bool get responsiveFromLaptop {
    return this == Breakpoint.laptop || responsiveFromDesktop;
  }

  bool get responsiveFromDesktop {
    return this == Breakpoint.desktop || responsiveFromNextLevelDesktop;
  }

  bool get responsiveFromNextLevelDesktop {
    return this == Breakpoint.nextLevelDesktop;
  }
}
