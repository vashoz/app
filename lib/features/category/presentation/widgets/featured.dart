import 'package:vashoz/features/category/presentation/widgets/shimmer/shimmer.dart';

import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../dashboard/presentation/widgets/section.dart';
import '../../../products/presentation/pages/products_by_category.dart';
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
            SectionTitle(
              icon: Icons.category_rounded,
              title: "Categories",
              press: () {
                context.pushNamed(CategoriesPage.name);
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.padding.horizontal.max,
              ),
              height: Dimension.size.vertical.oneHundred,
              child: BlocBuilder<FindFeaturedCategoriesBloc, FindFeaturedCategoriesState>(
                builder: (context, state) {
                  if (state is FindFeaturedCategoriesDone) {
                    return ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(width: Dimension.padding.horizontal.ultraMax),
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color.fromARGB(
                                          128,
                                          Random().nextInt(256),
                                          Random().nextInt(256),
                                          Random().nextInt(256),
                                        ),
                                        radius: 24,
                                        child: Icon(
                                          category.icon,
                                          size: 20,
                                          color:
                                              themeState.mode == ThemeMode.dark ? theme.textPrimary : theme.backgroundPrimary,
                                        ),
                                      ),
                                      SizedBox(height: Dimension.padding.vertical.medium),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Dimension.padding.horizontal.medium,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                            128,
                                            Random().nextInt(155),
                                            Random().nextInt(100),
                                            Random().nextInt(256),
                                          ),
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        child: Text(
                                          category.name,
                                          textAlign: TextAlign.center,
                                          style: context.textStyle10Regular(
                                              color: themeState.mode == ThemeMode.dark
                                                  ? theme.textPrimary
                                                  : theme.backgroundPrimary),
                                        ),
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
