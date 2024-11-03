import '../../cart.dart';
import 'cart_item.dart';
import 'cart_local_item_model.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.items,
  });

  factory CartModel.parse({
    required Map<String, dynamic> map,
  }) {
    assert(map['items'] != null);
    assert(map['items'] is List<dynamic>);
    final List<Map<String, dynamic>> itemsMap =
        List<Map<String, dynamic>>.from(map['items'] ?? []);
    final List<CartItemEntity> items =
        itemsMap.map((e) => CartItemModel.parse(map: e)).toList();

    return CartModel(
      items: items,
    );
  }
}
