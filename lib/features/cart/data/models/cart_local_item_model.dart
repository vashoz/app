import 'package:vashoz/features/products/products.dart';

import 'cart_item.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.quantity,
    required super.product,
  });

  factory CartItemModel.parse({
    required Map<String, dynamic> map,
  }) {
    assert(map.containsKey("quantity"));
    assert(map["quantity"] != null);
    assert(map["quantity"] is int);
    final int quantity = map["quantity"] as int;

    assert(map.containsKey("product"));
    assert(map["product"] != null);
    assert(map["product"] is Map<String, dynamic>);
    final Map<String, dynamic> productMap =
        Map<String, dynamic>.from(map["product"]);
    final ProductsModel product = ProductsModel.parse(map: productMap);

    return CartItemModel(
      quantity: quantity,
      product: product,
    );
  }
}
