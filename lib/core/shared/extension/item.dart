import 'package:vashoz/features/products/products.dart';

import '../../../features/cart/data/models/cart_item.dart';

extension CartItemEntityExtension on CartItemEntity {
  Map<String, dynamic> get toMap {
    return {
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  CartItemEntity copyWith({
    int? quantity,
    ProductsModel? product,
  }) {
    return CartItemEntity(
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }
}
