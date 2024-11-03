import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../products/presentation/pages/products_by_category.dart';
import '../../category.dart';
import '../widgets/shimmer/shimmer_categories.dart';

class CategoriesPage extends StatefulWidget {
  static const name = "Categories";
  static const path = "/categories";
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            automaticallyImplyLeading: true,
            iconTheme: IconThemeData(color: theme.textPrimary),
            centerTitle: true,
            title: Text(
              'Categories',
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
          ),
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
            child: BlocBuilder<FindAllCategoriesBloc, FindAllCategoriesState>(
              builder: (context, state) {
                if (state is FindAllCategoriesDone) {
                  final categories = state.categories;
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 1,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final slug = categories[index];
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
                                  child: CategoryTile(category: category));
                            } else if (state is FindCategoryLoading) {
                              return const ShimmerCategories();
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      );
                    },
                  );
                } else if (state is FindAllCategoriesLoading) {
                  return const ShimmerCategories();
                } else {
                  return const ShimmerCategories();
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class CategoryTile extends StatelessWidget {
  final CategoryEntity category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(
              128,
              Random().nextInt(156),
              Random().nextInt(100),
              Random().nextInt(92),
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(category.icon, size: 40, color: theme.iconColor),
              const SizedBox(height: 8.0),
              Text(category.name, style: context.textStyle13Regular(color: theme.iconColor)),
            ],
          ),
        );
      },
    );
  }
}
