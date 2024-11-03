part of 'product_cart_bloc.dart';

class ProductCartState extends Equatable {
  final ProductsModel? product;
  final int quantity;

  const ProductCartState({
    this.product,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        quantity,
      ];

  //copyWith
  ProductCartState copyWith({
    int? requiredToppingCount,
    int? quantity,
  }) {
    return ProductCartState(
      quantity: quantity ?? this.quantity,
      product: product ?? product,
    );
  }
}
