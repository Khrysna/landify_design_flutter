import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static final TextStyle displayExtraLargeBold = _baseTextStyle.copyWith(
    fontSize: 60,
    fontWeight: FontWeight.bold,
    height: 72 / 60,
    letterSpacing: -2.5,
  );

  static final TextStyle displayLargeBold = _baseTextStyle.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    height: 60 / 48,
    letterSpacing: -2.5,
  );

  static final TextStyle displayMediumBold = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    height: 45 / 36,
    letterSpacing: -2.5,
  );

  static final TextStyle displaySmallBold = _baseTextStyle.copyWith(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    height: 40 / 30,
  );


  static final TextStyle bodyLargeRegular = _baseTextStyle.copyWith(
    fontSize: 18,
    height: 28 / 18,
  );

  static final TextStyle bodyMediumSemiBold = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
  );

  static final TextStyle bodyMediumRegular = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 24 / 16,
  );

  static final TextStyle bodySmallSemiBold = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
  );

  static const _baseTextStyle = TextStyle(
    fontWeight: FontWeight.normal,
    textBaseline: TextBaseline.alphabetic,
    decoration: TextDecoration.none,
    fontFamily: 'Inter',
  );
}
