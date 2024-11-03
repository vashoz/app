import 'package:vashoz/features/products/presentation/bloc/product_cart_bloc.dart';

import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../product_details/product_details.dart';
import '../../../products/presentation/pages/popular.dart';
import '../../../products/presentation/widgets/shimmer/shimmer.dart';
import '../../../products/products.dart';
import 'section.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularProductsBloc, PopularProductsState>(
      builder: (context, state) {
        if (state is PopularProductsLoading) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimension.padding.horizontal.max,
                vertical: Dimension.padding.vertical.max),
            child: const ShimmerProduct(),
          );
        } else if (state is PopularProductsDone) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.max,
                    vertical: Dimension.padding.vertical.max),
                child: SectionTitle(
                  icon: Icons.local_offer_rounded,
                  title: "Popular Products",
                  press: () {
                    context.pushNamed(
                      PopularProductsPage.name,
                      extra: {'slug': ""},
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                            create: (context) => sl<FindProductBloc>()
                              ..add(FindProduct(slug: state.products[index]))),
                        BlocProvider(
                            create: (context) => sl<ProductCartBloc>()),
                      ],
                      child: ProductCard(
                        onPress: () {
                          context.pushNamed(
                            ProductDetailPage.name,
                            extra: {'model': state.products[index]},
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
