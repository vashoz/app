import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../product_details/product_details.dart';
import '../../../product/presentation/bloc/product_cart_bloc.dart';
import '../../../product/product.dart';
import 'section.dart';

class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewArrivalProductsBloc, NewArrivalProductsState>(
      builder: (context, state) {
        if (state is NewArrivalProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewArrivalProductsDone) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimension.padding.horizontal.max,
                    vertical: Dimension.padding.vertical.max),
                child: SectionHeaderWidget(
                  icon: Icons.new_releases,
                  title: "New Arrivals",
                  onSeeMore: () {
                    context.pushNamed(
                      NewArrivalProductsPage.name,
                      extra: {
                        'slug': "",
                      },
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
