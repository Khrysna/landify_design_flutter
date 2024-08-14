import 'package:flutter/material.dart';
import 'package:landify_design_flutter/utils/constants.dart';

class MainNotifier extends ValueNotifier<bool> {
  MainNotifier() : super(false);

  void onScrollOffsetChanged(double offset) {
    final isExceedNavbar = offset > Constants.kNavigationBarHeight;

    if (value != isExceedNavbar) {
      value = isExceedNavbar;
    }
  }
}