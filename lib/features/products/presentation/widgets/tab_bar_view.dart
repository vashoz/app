import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../category/category.dart';
import '../../../product_details/product_details.dart';
import '../../products.dart';
import '../bloc/find_products_bloc.dart';
import '../bloc/product_cart_bloc.dart';

class TabBarViewWidget extends StatelessWidget {
  final TabController controller;
  const TabBarViewWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindAllCategoriesBloc, FindAllCategoriesState>(
      builder: (context, state) {
        if (state is FindAllCategoriesDone) {
          return Expanded(
            child: TabBarView(
              controller: controller,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              physics: const BouncingScrollPhysics(),
              children: state.categories
                  .map(
                    (e) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (context) => sl<FindProductBloc>()
                              ..add(FindProduct(slug: e))),
                        BlocProvider(create: (_) => sl<ProductCartBloc>()),
                      ],
                      child: ProductView(slug: e),
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class ProductView extends StatefulWidget {
  final String slug;
  const ProductView({super.key, required this.slug});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    context.read<FindProductsBloc>().add(FindProducts(slug: widget.slug));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindProductsBloc, FindProductsState>(
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
                return ProductCard(
                  onPress: () {
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
    );
  }
}
