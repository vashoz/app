import '../../../../core/shared/shared.dart';
import '../../data/models/cart_item.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> items;

  const CartEntity({
    required this.items,
  });

  @override
  List<Object?> get props => [
        items,
      ];
}
