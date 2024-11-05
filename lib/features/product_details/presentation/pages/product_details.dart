import 'package:vashoz/features/cart/presentation/widgets/cart_quantity.dart';
import 'package:vashoz/features/favorite/favorite.dart';
import 'package:vashoz/features/product_details/presentation/widgets/variants.dart';
import 'package:vashoz/features/variant/variant.dart';

import '../../../../core/shared/shared.dart';
import '../../../cart/cart.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../cart/data/models/cart_item.dart';
import '../../../product/presentation/bloc/product_cart_bloc.dart';
import '../../../product/product.dart';
import '../../../reviews/reviews.dart';
import '../widgets/photos.dart';

class ProductDetailPage extends StatefulWidget {
  static const String name = 'Product_details';
  static const String path = '/product_details';
  final String slug;
  const ProductDetailPage({super.key, required this.slug});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  VariantEntity? selectVariant;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundSecondary,
          body: BlocBuilder<FindProductBloc, FindProductState>(
            builder: (context, state) {
              if (state is FindProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FindProductDone) {
                final product = state.product;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          ProductDetailsPhotos(
                            product: product,
                          ),
                          SizedBox(height: Dimension.padding.vertical.small),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$taka ${selectVariant == null ? product.variants.first.price.toString() : selectVariant?.price.toString()}",
                                  style: context.textStyle25Bold(color: theme.positive),
                                ),
                                FavoriteButtonWidget(slug: product.url),
                              ],
                            ),
                          ),
                          SizedBox(height: Dimension.padding.vertical.medium),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                            child: Text(
                              product.productName.toString(),
                              style: context.textStyle15Regular(color: theme.textPrimary),
                            ),
                          ),
                          SizedBox(height: Dimension.padding.vertical.medium),
                          InkWell(
                            onTap: () {
                              context.pushNamed(ReviewsPage.name);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                              child: Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 20),
                                  const Icon(Icons.star, color: Colors.amber, size: 20),
                                  const Icon(Icons.star, color: Colors.amber, size: 20),
                                  const Icon(Icons.star, color: Colors.amber, size: 20),
                                  const Icon(Icons.star_half, color: Colors.amber, size: 20),
                                  SizedBox(width: Dimension.padding.horizontal.medium),
                                  Text(
                                    '4.5 (89 reviews)',
                                    style: context.textStyle13Regular(color: theme.textLight),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: Dimension.padding.vertical.max),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                            child: Text(
                              product.description,
                              style: context
                                  .textStyle13Regular(color: theme.textLight)
                                  .copyWith(letterSpacing: 0, height: 0, fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(height: Dimension.padding.vertical.max),
                          Visibility(
                            visible: product.variants.length > 1,
                            child: ProductDetailsVariants(
                                product: product,
                                onVariantSelected: (variant) {
                                  setState(() {
                                    selectVariant = variant;
                                  });
                                }),
                          ),
                          SizedBox(height: Dimension.padding.vertical.max),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                            child: Text(
                              "Related Products",
                              style: context.textStyle15Regular(color: theme.textPrimary),
                            ),
                          ),
                          SizedBox(height: Dimension.padding.vertical.max),
                          SizedBox(
                            height: context.height * .32,
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: Dimension.padding.horizontal.max),
                              itemCount: product.relatedProducts.length,
                              itemBuilder: (context, index) {
                                final productSlug = product.relatedProducts[index];
                                return Container(
                                  margin: EdgeInsets.only(right: Dimension.padding.horizontal.medium),
                                  width: context.width / 2,
                                  child: ProductWidget(
                                    onTap: () {
                                      context.pushNamed(
                                        ProductDetailPage.name,
                                        extra: {'model': productSlug},
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartEntity?>(
                      builder: (context, cartState) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: cartState != null && cartState.items.isNotEmpty,
                              child: Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.zero.copyWith(left: Dimension.padding.horizontal.max),
                                  padding: EdgeInsets.symmetric(
                                    vertical: Dimension.padding.vertical.medium,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: theme.backgroundPrimary,
                                    borderRadius: BorderRadius.circular(
                                      Dimension.radius.sixteen,
                                    ),
                                  ),
                                  child: BlocBuilder<CartBloc, CartEntity?>(
                                    builder: (context, state) {
                                      final CartEntity? cart = state;
                                      final item = cart?.items.firstWhere((element) => element.product.guid == product.guid);
                                      return CartItemQuantity(
                                        item: item ??
                                            CartItemEntity(
                                              product: product,
                                              quantity: 1,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: BlocBuilder<ProductCartBloc, ProductCartState>(
                                builder: (context, state) {
                                  return CustomButton(
                                    text: cartState == null || cartState.items.isEmpty ? 'Add to cart' : 'View cart',
                                    onTap: cartState == null || cartState.items.isEmpty
                                        ? () {
                                            context.read<CartBloc>().add(
                                                  AddToCartEvent(
                                                    context: context,
                                                    quantity: state.quantity,
                                                    product: product,
                                                  ),
                                                );
                                            TaskNotifier.instance
                                                .success(context, message: "${product.productName} added successfully");
                                          }
                                        : () {
                                            context.pushNamed(
                                              CartPage.name,
                                            );
                                          },
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: Dimension.padding.vertical.max),
                  ],
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
