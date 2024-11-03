part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<ProductEntity> products;
  final deliveryFee = 1.0;

  const CartState({this.products = const []});

  double get totalPrice => products.fold(
      0,
      (total, current) =>
          total + (current.variants.first.price * 1) + deliveryFee);

  @override
  List<Object> get props => [products];

  CartState copyWith({List<ProductEntity>? products}) {
    return CartState(
      products: products ?? this.products,
    );
  }
}
