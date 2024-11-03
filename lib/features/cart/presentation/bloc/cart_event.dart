part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends CartEvent {
  final BuildContext context;
  final int quantity;
  final ProductEntity product;

  const AddToCartEvent({
    required this.context,
    required this.quantity,
    required this.product,
  });

  @override
  List<Object?> get props => [
        product,
      ];
}

class IncrementQuantityEvent extends CartEvent {
  final CartItemEntity item;

  const IncrementQuantityEvent({
    required this.item,
  });

  @override
  List<Object?> get props => [item];
}

class DecrementQuantityEvent extends CartEvent {
  final CartItemEntity item;

  const DecrementQuantityEvent({
    required this.item,
  });

  @override
  List<Object?> get props => [item];
}

class ClearCart extends CartEvent {
  const ClearCart();

  @override
  List<Object?> get props => [];
}
