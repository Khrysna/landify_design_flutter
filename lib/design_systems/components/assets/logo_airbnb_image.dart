import 'package:flutter/material.dart';

class LogoAirbnbImage extends StatelessWidget {
  const LogoAirbnbImage({super.key}) : height = 28;

  const LogoAirbnbImage.larger({super.key}) : height = 32;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_airbnb.png', height: height);
  }
}
