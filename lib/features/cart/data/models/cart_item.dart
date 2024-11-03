import 'package:vashoz/features/products/products.dart';

import '../../../../core/shared/shared.dart';

class CartItemEntity extends Equatable {
  final int quantity;
  final ProductEntity product;

  const CartItemEntity({
    required this.quantity,
    required this.product,
  });

  @override
  List<Object?> get props => [product, quantity];

  CartItemEntity? copyWith({
    int? quantity,
  }) {
    return CartItemEntity(
      quantity: quantity ?? this.quantity,
      product: product,
    );
  }
}
