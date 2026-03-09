import 'package:bookly_app/Core/utils/assets_data.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [CustomAppBar(), CustomFeaturedListItem()]);
  }
}

class CustomFeaturedListItem extends StatelessWidget {
  const CustomFeaturedListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .23,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: AssetImage(AssetsData.testImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
