import 'package:vashoz/features/products/products.dart';

import '../../../../core/shared/shared.dart';
import '../../../filter/filter.dart';
import '../../../product_details/product_details.dart';

class NewArrivalProductsPage extends StatefulWidget {
  static const String path = '/new-arrival-products';
  static const String name = 'NewArrivalProductsPage';
  const NewArrivalProductsPage({
    super.key,
  });

  @override
  State<NewArrivalProductsPage> createState() => _NewArrivalProductsPageState();
}

class _NewArrivalProductsPageState extends State<NewArrivalProductsPage> {
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
            title: Text("New Arrivals", style: context.textStyle15SemiBold(color: theme.textPrimary)),
            actions: [
              IconButton(
                icon: Icon(Icons.tune, color: theme.textPrimary),
                onPressed: () {
                  context.pushNamed(FilterPage.name);
                },
              ),
            ],
          ),
          body: BlocBuilder<NewArrivalProductsBloc, NewArrivalProductsState>(
            builder: (context, state) {
              if (state is NewArrivalProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewArrivalProductsDone) {
                final products = state.products;
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
          ),
        );
      },
    );
  }
}
