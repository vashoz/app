part of 'product_cart_bloc.dart';

sealed class ProductCartEvent extends Equatable {
  const ProductCartEvent();

  @override
  List<Object> get props => [];
}

class IncrementQuantity extends ProductCartEvent {}

class DecrementQuantity extends ProductCartEvent {}
