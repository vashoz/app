import '../../../../core/shared/shared.dart';
import '../../../cart/cart.dart';
import '../../../cart/data/models/cart_item.dart';

class ChangeQuantity extends StatelessWidget {
  final CartItemEntity item;
  const ChangeQuantity({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  context
                      .read<CartBloc>()
                      .add(DecrementQuantityEvent(item: item));
                },
                child: Icon(Icons.remove, color: theme.positive)),
            SizedBox(
              width: 8,
              child: Center(
                child: Text(
                  item.quantity.round().toString(),
                  style: context.textStyle12Regular(color: theme.positive),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  context
                      .read<CartBloc>()
                      .add(IncrementQuantityEvent(item: item));
                },
                child: Icon(Icons.add, color: theme.positive)),
          ],
        );
      },
    );
  }
}
