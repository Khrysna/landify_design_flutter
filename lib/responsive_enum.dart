import 'package:flutter/cupertino.dart';

extension ResponsiveEnumExt on BuildContext {
  ResponsiveEnum get responsive {
    final width = MediaQuery.sizeOf(this).width;

    if (width > 1536) {
      return ResponsiveEnum.nextLevelDesktop;
    } else if (width > 1280) {
      return ResponsiveEnum.desktop;
    } else if (width > 1024) {
      return ResponsiveEnum.laptop;
    } else if (width > 640) {
      return ResponsiveEnum.tablet;
    }

    return ResponsiveEnum.mobile;
  }
}

enum ResponsiveEnum {
  mobile,
  tablet,
  laptop,
  desktop,
  nextLevelDesktop;

  bool get responsiveOnlyMobile {
    return this == ResponsiveEnum.mobile;
  }

  bool get responsiveFromMobile {
    return this == ResponsiveEnum.mobile || responsiveFromTablet;
  }

  bool get responsiveFromTablet {
    return this == ResponsiveEnum.tablet || responsiveFromLaptop;
  }

  bool get responsiveFromLaptop {
    return this == ResponsiveEnum.laptop || responsiveFromDesktop;
  }

  bool get responsiveFromDesktop {
    return this == ResponsiveEnum.desktop || responsiveFromNextLevelDesktop;
  }

  bool get responsiveFromNextLevelDesktop {
    return this == ResponsiveEnum.nextLevelDesktop;
  }
}
