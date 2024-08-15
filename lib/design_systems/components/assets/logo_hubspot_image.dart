import 'package:flutter/material.dart';

class LogoHubspotImage extends StatelessWidget {
  const LogoHubspotImage({super.key}) : height = 28;

  const LogoHubspotImage.larger({super.key}) : height = 32;

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_hubspot.png', height: height);
  }
}
