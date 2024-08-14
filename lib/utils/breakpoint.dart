import 'package:flutter/material.dart';
import 'package:landify_design_flutter/design_systems/components/responsive_row_column.dart';

enum Breakpoint {
  mobile(0, 640),
  tablet(641, 1024),
  laptop(1025, 1280),
  desktop(1281, 1536);

  const Breakpoint(this.start, this.end);

  final double start;

  final double end;

  /// Smaller or Equal
  bool get smallerOrEqualToTablet {
    return this == Breakpoint.mobile || this == Breakpoint.tablet;
  }

  bool get smallerOrEqualToLaptop {
    return smallerOrEqualToTablet || this == Breakpoint.laptop;
  }

  bool get smallerOrEqualToDesktop {
    return smallerOrEqualToLaptop || this == Breakpoint.desktop;
  }

  /// larger than
  bool get largerThanMobile {
    return this == Breakpoint.tablet || largerThanTablet;
  }

  bool get largerThanTablet {
    return this == Breakpoint.laptop || largerThanLaptop;
  }

  bool get largerThanLaptop {
    return this == Breakpoint.desktop;
  }

  /// Larger or Equal
  bool get largerOrEqualToMobile {
    return this == Breakpoint.mobile || largerOrEqualToTablet;
  }

  bool get largerOrEqualToTablet {
    return this == Breakpoint.tablet || largerOrEqualToLaptop;
  }

  bool get largerOrEqualToLaptop {
    return this == Breakpoint.laptop || this == Breakpoint.desktop;
  }

  bool largerOrEqualTo(Breakpoint breakpoint) {
    return switch (breakpoint) {
      Breakpoint.mobile => largerOrEqualToMobile,
      Breakpoint.tablet => largerOrEqualToTablet,
      Breakpoint.laptop => largerOrEqualToLaptop,
      Breakpoint.desktop => equals(Breakpoint.desktop),
    };
  }

  /// Equals
  bool equals(Breakpoint breakpoint) {
    return this == breakpoint;
  }

  static Breakpoint get(double width) {
    if (width > Breakpoint.laptop.end) {
      return Breakpoint.desktop;
    } else if (width > Breakpoint.tablet.end) {
      return Breakpoint.laptop;
    } else if (width > Breakpoint.mobile.end) {
      return Breakpoint.tablet;
    }

    return Breakpoint.mobile;
  }
}

class BreakpointProvider extends InheritedWidget {
  const BreakpointProvider({
    super.key,
    required this.breakpoint,
    required super.child,
  });

  final Breakpoint breakpoint;

  static Breakpoint of(BuildContext context) {
    final data = context.dependOnInheritedWidgetOfExactType<BreakpointProvider>();

    if (data == null) {
      throw FlutterError.fromParts(
        <DiagnosticsNode>[
          ErrorSummary(
            'BreakpointProvider.of() called with a context that does not contain BreakpointProvider.',
          ),
          ErrorDescription(
            'No Responsive ancestor could be found starting from the context that was passed '
            'to BreakpointProvider.of(). Place a BreakpointProvider at the root of the app ',
          ),
          context.describeElement('The context used was')
        ],
      );
    }

    return data.breakpoint;
  }

  @override
  bool updateShouldNotify(BreakpointProvider oldWidget) {
    return oldWidget.breakpoint != breakpoint;
  }
}

extension BreakpointExtension on Breakpoint {
  ResponsiveRowColumnType getRowTypeWhenLargerOrEqualTo(Breakpoint breakpoint) {
    return largerOrEqualTo(breakpoint)
        ? ResponsiveRowColumnType.row
        : ResponsiveRowColumnType.column;
  }
}
