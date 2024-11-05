import '../../../../core/shared/shared.dart';
import '../../../cart/cart.dart';
import '../../../favorite/favorite.dart';
import '../../product.dart';

class ProductWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ProductWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, state) {
        final theme = state.scheme;
        return BlocBuilder<FindProductBloc, FindProductState>(
          builder: (_, state) {
            if (state is FindProductDone) {
              final product = state.product;
              return GestureDetector(
                onTap: onTap,
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.backgroundSecondary),
                          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: product.productImages.first,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: Dimension.padding.vertical.small),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimension.padding.horizontal.medium,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.productName,
                                    style: context.textStyle12Regular(color: theme.textPrimary),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${product.variants.first.size}${product.variants.first.unit}",
                                        style: context.textStyle10Regular(color: theme.textSecondary),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      SizedBox(width: Dimension.padding.horizontal.medium),
                                      Icon(Icons.circle,
                                          size: Dimension.padding.horizontal.small, color: theme.textSecondary.withAlpha(150)),
                                      SizedBox(width: Dimension.padding.horizontal.medium),
                                      Text(
                                        "$taka${product.variants.first.price}",
                                        style: context.textStyle10Regular(color: theme.textSecondary),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Dimension.padding.vertical.small),
                                  RatingBarIndicator(
                                    itemBuilder: (_, __) => Icon(
                                      Icons.star_rounded,
                                      color: theme.primary,
                                      size: Dimension.radius.twelve,
                                    ),
                                    itemCount: 5,
                                    rating: 5,
                                    itemSize: Dimension.radius.twelve,
                                    itemPadding: const EdgeInsets.all(0),
                                    direction: Axis.horizontal,
                                    unratedColor: theme.backgroundSecondary,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimension.size.vertical.seven),
                            Divider(
                              color: theme.backgroundSecondary,
                              thickness: 1,
                              height: Dimension.padding.vertical.min,
                            ),
                            BlocBuilder<ProductCartBloc, ProductCartState>(
                              builder: (context, state) {
                                return InkWell(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(Dimension.radius.sixteen),
                                  ),
                                  onTap: () {
                                    context.read<CartBloc>().add(
                                          AddToCartEvent(
                                            context: context,
                                            quantity: state.quantity,
                                            product: product,
                                          ),
                                        );
                                  },
                                  child: BlocBuilder<CartBloc, CartEntity?>(
                                    builder: (context, state) {
                                      final CartEntity? cart = state;
                                      final item = cart?.items.firstWhere((element) => element.product.guid == product.guid);
                                      if (item != null) {
                                        return ChangeQuantity(item: item);
                                      } else {
                                        return Container(
                                          padding: const EdgeInsets.all(8.0),
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add_shopping_cart_rounded,
                                                color: theme.link,
                                                size: Dimension.radius.twelve,
                                              ),
                                              SizedBox(width: Dimension.padding.horizontal.medium),
                                              Text(
                                                "Add to cart".toUpperCase(),
                                                style: context.textStyle10Regular(color: theme.link),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (product.discount != null)
                      Positioned(
                        top: 6,
                        left: 6,
                        child: Container(
                          width: context.width * 0.1,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: theme.negative,
                            borderRadius: BorderRadius.circular(Dimension.radius.fortyEight),
                          ),
                          padding: EdgeInsets.symmetric(vertical: Dimension.padding.vertical.min),
                          child: Text(
                            "15%",
                            style: context.textStyle10Regular(color: theme.white),
                          ),
                        ),
                      ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: FavoriteButtonWidget(slug: product.url),
                    ),
                  ],
                ),
              );
            } else if (state is FindProductLoading) {
              return const ShimmerProduct();
            } else if (state is FindProductError) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}
