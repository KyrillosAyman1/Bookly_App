import 'package:bookly_app/Core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class SlidingLogo extends StatelessWidget {
  const SlidingLogo({
    super.key,
    required this.slidingLogoAnimation,
  });

  final Animation<Offset> slidingLogoAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slidingLogoAnimation,
      child: Image.asset(AssetsData.logo),
    );
  }
}
