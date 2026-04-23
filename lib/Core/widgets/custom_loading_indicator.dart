import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum LoadingIndicatorType { featuredBooks, newestBooks, bookCover }

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.type = LoadingIndicatorType.featuredBooks,
  });

  final LoadingIndicatorType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingIndicatorType.newestBooks:
        return const _NewestBooksLoading();
      case LoadingIndicatorType.bookCover:
        return const BookCoverShimmer();
      case LoadingIndicatorType.featuredBooks:
        return const _FeaturedBooksLoading();
    }
  }
}

class BookCoverShimmer extends StatelessWidget {
  const BookCoverShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ShimmerContainer(
      width: double.infinity,
      height: double.infinity,
      borderRadius: 16,
    );
  }
}

class _FeaturedBooksLoading extends StatelessWidget {
  const _FeaturedBooksLoading();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .23,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const AspectRatio(
          aspectRatio: 2.6 / 4,
          child: _ShimmerContainer(borderRadius: 16),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: 6,
      ),
    );
  }
}

class _NewestBooksLoading extends StatelessWidget {
  const _NewestBooksLoading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: List.generate(
          5,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: _NewestBookItemShimmer(),
          ),
        ),
      ),
    );
  }
}

class _NewestBookItemShimmer extends StatelessWidget {
  const _NewestBookItemShimmer();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 125,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: _ShimmerContainer(borderRadius: 14),
          ),
          SizedBox(width: 30),
          Expanded(child: _NewestBookInfoShimmer()),
        ],
      ),
    );
  }
}

class _NewestBookInfoShimmer extends StatelessWidget {
  const _NewestBookInfoShimmer();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         _ShimmerContainer(width: 180, height: 20, borderRadius: 8),
         SizedBox(height: 8),
         _ShimmerContainer(width: 110, height: 14, borderRadius: 8),
         Spacer(),
        Row(
          children: const [
            _ShimmerContainer(width: 56, height: 18, borderRadius: 20),
            Spacer(),
            _ShimmerContainer(width: 70, height: 18, borderRadius: 20),
          ],
        ),
      ],
    );
  }
}

class _ShimmerContainer extends StatelessWidget {
  const _ShimmerContainer({
    this.width,
    this.height,
    this.borderRadius = 12,
  });

  final double? width;
  final double? height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF241A3D),
      highlightColor: const Color(0xFF3A2D5A),
      period: const Duration(milliseconds: 1100),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white,
        ),
      ),
    );
  }
}
