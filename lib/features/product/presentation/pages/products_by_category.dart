import 'package:vashoz/features/product/product.dart';

import '../../../../core/shared/shared.dart';
import '../../../filter/filter.dart';
import '../../../product_details/product_details.dart';
import '../bloc/find_products_bloc.dart';

class ProductsByCategoryPage extends StatefulWidget {
  static const String path = '/products_by_category_page';
  static const String name = 'ProductsByCategoryPage';
  final String category;
  const ProductsByCategoryPage({
    super.key,
    required this.category,
  });

  @override
  State<ProductsByCategoryPage> createState() => _ProductsByCategoryPageState();
}

class _ProductsByCategoryPageState extends State<ProductsByCategoryPage> {
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
            title: Text(widget.category, style: context.textStyle15SemiBold(color: theme.textPrimary)),
            actions: [
              IconButton(
                icon: Icon(Icons.tune, color: theme.textPrimary),
                onPressed: () {
                  context.pushNamed(FilterPage.name);
                },
              ),
            ],
          ),
          body: BlocBuilder<FindProductsBloc, FindProductsState>(
            builder: (context, state) {
              if (state is FindProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FindProductsDone) {
                final products = state.categories;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.72,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductWidget(
                        onTap: () {
                          context.pushNamed(
                            ProductDetailPage.name,
                            extra: {'model': product},
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          ),
        );
      },
    );
  }
}
