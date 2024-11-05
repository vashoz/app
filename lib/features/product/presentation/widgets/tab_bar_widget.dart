import 'package:flutter/gestures.dart';

import '../../../../core/shared/shared.dart';
import '../../../category/category.dart';

class TabBarWidget extends StatelessWidget {
  final TabController controller;
  const TabBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return BlocBuilder<FindAllCategoriesBloc, FindAllCategoriesState>(
          builder: (_, state) {
            if (state is FindAllCategoriesError) {
              return const Icon(Icons.error);
            } else if (state is FindAllCategoriesLoading) {
              return PhysicalModel(
                color: theme.positive,
                child: SizedBox(
                  width: context.width,
                  height: kTextTabBarHeight,
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 16),
                        ShimmerLabel(width: 72, height: 8),
                        SizedBox(width: 24),
                        ShimmerLabel(width: 72, height: 8),
                        SizedBox(width: 24),
                        ShimmerLabel(width: 72, height: 8),
                        SizedBox(width: 24),
                        ShimmerLabel(width: 72, height: 8),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is FindAllCategoriesDone) {
              final categories = state.categories;
              return PhysicalModel(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                child: SizedBox(
                  width: double.infinity,
                  height: kTextTabBarHeight,
                  child: TabBar(
                    isScrollable: true,
                    controller: controller,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    unselectedLabelColor: theme.textPrimary,
                    automaticIndicatorColorAdjustment: false,
                    indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
                      color: theme.cardColor,
                      border: Border.all(color: theme.positive, width: 1.25),
                    ),
                    labelColor: theme.positive,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                    dragStartBehavior: DragStartBehavior.start,
                    labelStyle: TextStyles.subTitle(context: context, color: theme.positive).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: TextStyles.body(context: context, color: theme.textPrimary).copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    indicatorColor: theme.positive,
                    physics: const BouncingScrollPhysics(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    onTap: (value) {
                      controller.animateTo(value);
                    },
                    enableFeedback: true,
                    tabs: categories
                        .map(
                          (category) => Tab(
                            iconMargin: EdgeInsets.zero,
                            child: Text(category),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            } else {
              return const Icon(Icons.warning);
            }
          },
        );
      },
    );
  }
}
