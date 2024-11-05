import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../dashboard/dashboard.dart';
import '../../../product/product.dart';
import '../../category.dart';

class FeaturedCategoriesWidget extends StatelessWidget {
  const FeaturedCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        final theme = themeState.scheme;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeaderWidget(
              icon: Icons.category_rounded,
              title: "Categories",
              onSeeMore: () {
                context.pushNamed(CategoriesPage.name);
              },
            ),
            Container(
              height: Dimension.size.vertical.seventyTwo,
              margin: const EdgeInsets.all(0).copyWith(
                top: Dimension.padding.vertical.max,
                bottom: Dimension.padding.vertical.ultraMax,
              ),
              child: BlocBuilder<FindFeaturedCategoriesBloc, FindFeaturedCategoriesState>(
                builder: (context, state) {
                  if (state is FindFeaturedCategoriesDone) {
                    return Center(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => SizedBox(
                          width: Dimension.padding.horizontal.ultraMax,
                        ),
                        itemCount: state.categories.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero.copyWith(right: Dimension.padding.horizontal.ultraMax),
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final slug = state.categories[index];
                          return BlocProvider(
                            create: (context) => sl<FindCategoryBloc>()..add(FindCategory(slug: slug)),
                            child: BlocBuilder<FindCategoryBloc, FindCategoryState>(
                              builder: (context, state) {
                                if (state is FindCategoryDone) {
                                  final category = state.category;
                                  return InkWell(
                                    onTap: () {
                                      context.pushNamed(
                                        ProductsByCategoryPage.name,
                                        extra: {
                                          'name': category.name,
                                          'slug': category.url,
                                        },
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: theme.link.withAlpha(15),
                                          radius: 24,
                                          child: Icon(
                                            category.icon,
                                            size: 20,
                                            color: theme.link,
                                          ),
                                        ),
                                        SizedBox(height: Dimension.padding.vertical.medium),
                                        Text(
                                          category.name,
                                          textAlign: TextAlign.center,
                                          style: context.textStyle10Regular(color: theme.link),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (state is FindCategoryLoading) {
                                  return const ShimmerFeaturedCategories();
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is FindFeaturedCategoriesError) {
                    return Text(state.failure.message);
                  } else if (state is FindFeaturedCategoriesLoading) {
                    return const ShimmerFeaturedCategories();
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
