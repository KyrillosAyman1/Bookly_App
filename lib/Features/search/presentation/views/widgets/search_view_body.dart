import 'package:bookly_app/Core/utils/app_styles.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(right: 16),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios, size: 26),
              ),
              const Expanded(child: CustomSearchTextField()),
            ],
          ),
          const SizedBox(height: 16),
          const Text("Search Result", style: AppStyles.textStyle18),
          const SizedBox(height: 6),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
