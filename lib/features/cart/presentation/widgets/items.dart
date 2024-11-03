import 'package:collection/collection.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/shared/shared.dart';
import '../../cart.dart';
import '../../data/models/cart_item.dart';
import 'cart_quantity.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return BlocBuilder<CartBloc, CartEntity?>(
          builder: (context, cartState) {
            final CartEntity? cart = cartState;
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: Dimension.padding.vertical.medium);
              },
              shrinkWrap: true,
              itemCount: cartState?.items.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final CartItemEntity product = cart!.items.elementAt(index);
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          //context.read<CartBloc>().add(DeleteCartItemEvent(product: product));
                        },
                        backgroundColor: theme.negative,
                        foregroundColor: theme.backgroundPrimary,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: state.mode == ThemeMode.dark ? theme.cardColor : theme.backgroundPrimary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimension.radius.sixteen),
                        bottomLeft: Radius.circular(Dimension.radius.sixteen),
                      ),
                    ),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Dimension.padding.horizontal.max, vertical: Dimension.padding.vertical.max),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(Dimension.radius.sixteen),
                        child: CachedNetworkImage(
                          imageUrl: product.product.productImages.first,
                          height: 54.h,
                          width: 54.w,
                        ),
                      ),
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "$taka ${(product.product.variants.firstWhereOrNull((variant) => variant.guid == product.product.variants.first.guid)?.price)} x ${product.quantity}",
                              style: context.textStyle12Regular(color: theme.positive)),
                          Text(product.product.productName, style: context.textStyle12Regular(color: theme.textPrimary)),
                          Text("${product.product.variants.first.size.toString()} ${product.product.variants.first.unit}",
                              style: context.textStyle12Regular(color: theme.textLight)),
                        ],
                      ),
                      trailing: CartItemQuantity(
                        item: product,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
