import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveBreakpointExtension on ResponsiveBreakpointsData {
  ResponsiveRowColumnType getRowTypeWhenLargerOrEqualTo(String name) {
    return largerOrEqualTo(name) ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN;
  }
}
