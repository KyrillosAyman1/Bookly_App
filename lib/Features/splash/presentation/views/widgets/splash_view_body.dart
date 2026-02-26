import 'package:bookly_app/Core/utils/assets_data.dart';
import 'package:bookly_app/Features/splash/presentation/views/widgets/sliding_logo.dart';
import 'package:bookly_app/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingTextAnimation;
  late Animation<Offset> slidingLogoAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingTextAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInOutBack,
          ),
        );
    slidingLogoAnimation =
        Tween<Offset>(begin: const Offset(0, -2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInOutBack,
          ),
        );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingLogo(slidingLogoAnimation: slidingLogoAnimation),
        const SizedBox(height: 4),
        SlidingText(slidingTextAnimation: slidingTextAnimation),
      ],
    );
  }
}

