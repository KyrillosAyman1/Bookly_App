import 'package:bookly_app/Core/utils/assets_data.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
           placeholder: (context, url) => const BookCoverShimmer(),
          errorWidget: (context, url, error) =>
              Image.asset(AssetsData.testImage, fit: BoxFit.fill),
        ),
      ),
    );
  }
}



/*
import 'package:bookly_app/Core/utils/assets_data.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, this.imageUrl});
  final String? imageUrl;

  bool get _hasValidImageUrl =>
      imageUrl != null && imageUrl!.trim().isNotEmpty;

  String get _safeImageUrl => imageUrl!.replaceFirst('http://', 'https://');

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _hasValidImageUrl
            ? CachedNetworkImage(
                imageUrl: _safeImageUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) => const BookCoverShimmer(),
                errorWidget: (context, url, error) => Image.asset(
                  AssetsData.testImage,
                  fit: BoxFit.fill,
                ),
              )
            : Image.asset(AssetsData.testImage, fit: BoxFit.fill),
      ),
    );
  }
}
*/

