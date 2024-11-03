import '../../../../core/shared/shared.dart';
import '../../cart.dart';
import '../../data/models/cart_item.dart';

class CartItemQuantity extends StatelessWidget {
  final CartItemEntity item;

  const CartItemQuantity({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                context
                    .read<CartBloc>()
                    .add(DecrementQuantityEvent(item: item));
              },
              icon: CircleAvatar(
                backgroundColor: theme.positive,
                radius: 16,
                child: Icon(Icons.remove, color: theme.backgroundPrimary),
              ),
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
            ),
            SizedBox(
              width: 20,
              child: Center(
                child: Text(
                  item.quantity.round().toString(),
                  style: context.textStyle15SemiBold(color: theme.positive),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                context
                    .read<CartBloc>()
                    .add(IncrementQuantityEvent(item: item));
              },
              icon: CircleAvatar(
                backgroundColor: theme.positive,
                radius: 16,
                child: Icon(Icons.add, color: theme.backgroundPrimary),
              ),
              visualDensity: VisualDensity.compact,
              padding: EdgeInsets.zero,
            ),
          ],
        );
      },
    );
  }
}
