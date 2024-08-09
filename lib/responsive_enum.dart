import 'package:flutter/cupertino.dart';

extension ResponsiveEnumExt on BuildContext {
  ResponsiveEnum get responsive {
    final width = MediaQuery.sizeOf(this).width;

    if (width > 0 && width <= 640) {
      return ResponsiveEnum.mobile;
    } else if (width > 640 && width <= 1024) {
      return ResponsiveEnum.tablet;
    }

    return ResponsiveEnum.desktop;
  }
}

enum ResponsiveEnum {
  mobile,
  tablet,
  desktop;

  bool get responsiveOnlyMobile {
    return this == ResponsiveEnum.mobile;
  }

  bool get responsiveFromTablet {
    return this == ResponsiveEnum.tablet || this == ResponsiveEnum.desktop;
  }

  bool get responsiveFromDesktop {
    return this == ResponsiveEnum.desktop;
  }
}
