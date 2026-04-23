import 'package:bookly_app/Core/utils/app_styles.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/newest_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CustomAppBar()),
        SliverToBoxAdapter(child: FeaturedBooksListView()),
        SliverToBoxAdapter(child: SizedBox(height: 40)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text("Newest Books", style: AppStyles.textStyle18),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        NewestListView(),
      ],
    );
  }
}
