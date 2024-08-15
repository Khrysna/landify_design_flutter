import 'package:flutter/material.dart';

class LandingMainBackground extends StatelessWidget {
  const LandingMainBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Image.asset(
      'assets/landing_main_background.png',
      width: double.infinity,
      fit: BoxFit.fill,
      height: height,
    );
  }
}
