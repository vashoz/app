import 'package:vashoz/features/products/products.dart';

import '../../../../../core/shared/shared.dart';
import '../../../../core/config/config.dart';
import '../../../product_details/product_details.dart';
import '../../../products/presentation/bloc/product_cart_bloc.dart';
import '../bloc/favorite_bloc.dart';

class FavoriteFragment extends StatelessWidget {
  final VoidCallback onPop;
  const FavoriteFragment({super.key, required this.onPop});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          appBar: AppBar(
            backgroundColor: theme.backgroundSecondary,
            centerTitle: true,
            title: Text(
              'Favorite',
              style: context.textStyle15SemiBold(color: theme.textPrimary),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: theme.textPrimary,
              ),
              onPressed: onPop,
            ),
          ),
          body: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              final items = state.products;
              return items.isEmpty
                  ? Center(
                      child: Text(
                        "No favorite product found",
                        style: context.textStyle15SemiBold(
                            color: theme.textPrimary),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      padding: EdgeInsets.all(Dimension.size.vertical.sixteen),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            Dimension.gridViewDimensions.maxCross,
                        childAspectRatio:
                            Dimension.gridViewDimensions.childAspectRatio,
                        mainAxisSpacing:
                            Dimension.gridViewDimensions.mainAxisSpacing,
                        crossAxisSpacing:
                            Dimension.gridViewDimensions.crossAxisSpacing,
                      ),
                      itemBuilder: (context, index) {
                        return MultiBlocProvider(
                          providers: [
                            BlocProvider(
                                create: (context) => sl<FindProductBloc>()
                                  ..add(FindProduct(
                                      slug: state.products[index]))),
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
                    );
            },
          ),
        );
      },
    );
  }
}
