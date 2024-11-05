import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';
import '../../../product/product.dart';
import '../../../product_details/product_details.dart';

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
              vertical: Dimension.padding.vertical.max,
            ),
            child: const ShimmerProduct(),
          );
        } else if (state is PopularProductsDone) {
          return Column(
            children: [
              SectionHeaderWidget(
                icon: Icons.local_offer_rounded,
                title: "Popular Products",
                onSeeMore: () {
                  context.pushNamed(
                    PopularProductsPage.name,
                    extra: {'slug': ""},
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.all(0).copyWith(
                  top: Dimension.padding.vertical.max,
                  bottom: Dimension.padding.vertical.ultraMax,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => sl<FindProductBloc>()..add(FindProduct(slug: state.products[index]))),
                        BlocProvider(create: (context) => sl<ProductCartBloc>()),
                      ],
                      child: ProductWidget(
                        onTap: () {
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
