import 'package:vashoz/core/shared/extension/item.dart';

import '../../../features/cart/cart.dart';
import '../../../features/cart/data/models/cart_item.dart';

extension CartEntityExtension on CartEntity {
  Map<String, dynamic> get toMap {
    return {
      'items': items.map((e) => e.toMap).toList(),
    };
  }

  CartEntity copyWith({
    List<CartItemEntity>? items,
  }) {
    return CartEntity(
      items: items ?? this.items,
    );
  }

  double vat(double vat) {
    return vat;
  }

  int get subTotal {
    return items.fold<int>(
      0,
      (previousValue, element) =>
          previousValue +
          element.product.variants.firstOrNull!.price * element.quantity,
    );
  }

  double vatAmount(double vat) {
    return subTotal * (vat / 100);
  }
}
