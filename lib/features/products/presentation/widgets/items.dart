import '../../../../core/shared/shared.dart';
import '../../../cart/cart.dart';
import '../../../favorite/favorite.dart';
import '../bloc/find_bloc.dart';
import '../bloc/product_cart_bloc.dart';
import 'quantity_button.dart';
import 'shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback onPress;
  const ProductCard({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return BlocBuilder<FindProductBloc, FindProductState>(
          builder: (context, productState) {
            if (productState is FindProductDone) {
              final product = productState.product;
              return GestureDetector(
                onTap: onPress,
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimension.padding.horizontal.max,
                          vertical: Dimension.padding.vertical.medium,
                        ),
                        decoration: BoxDecoration(
                          color: state.mode == ThemeMode.dark ? theme.textLight.withOpacity(.1) : theme.backgroundPrimary,
                          borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: Dimension.padding.vertical.max),
                            CachedNetworkImage(
                              imageUrl: product.productImages.first,
                            ),
                            SizedBox(height: Dimension.padding.vertical.max),
                            Text(
                              "$taka ${product.variants.first.price}",
                              style: context.textStyle15SemiBold(color: theme.positive),
                            ),
                            Text(
                              product.productName,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyle10Regular(color: theme.textPrimary),
                              maxLines: 2,
                            ),
                            Divider(
                              color: theme.backgroundSecondary,
                              thickness: 1,
                              height: 8,
                              indent: 0,
                              endIndent: 0,
                            ),
                            SizedBox(height: Dimension.padding.vertical.medium),
                            BlocBuilder<ProductCartBloc, ProductCartState>(
                              builder: (context, state) {
                                return InkWell(
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
                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: theme.positive,
                                              size: 18,
                                            ),
                                            SizedBox(width: Dimension.padding.horizontal.medium),
                                            Text(
                                              "Add to cart",
                                              style: context.textStyle13Regular(color: theme.textPrimary),
                                            ),
                                          ],
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
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: context.width * 0.1,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(
                            128,
                            Random().nextInt(256),
                            Random().nextInt(128),
                            Random().nextInt(128),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimension.radius.sixteen),
                            bottomRight: Radius.circular(Dimension.radius.eight),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimension.padding.horizontal.small,
                          vertical: Dimension.padding.vertical.small,
                        ),
                        child: Text(
                          "15%",
                          style: context.textStyle10Regular(color: theme.textSecondary),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 4,
                      child: FavoriteButtonWidget(
                        slug: product.url,
                      ),
                    ),
                  ],
                ),
              );
            } else if (productState is FindProductLoading) {
              return const ShimmerProduct();
            } else if (productState is FindProductError) {
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
