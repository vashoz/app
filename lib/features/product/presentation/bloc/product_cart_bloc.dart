import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vashoz/features/product/product.dart';

part 'product_cart_event.dart';
part 'product_cart_state.dart';

class ProductCartBloc extends Bloc<ProductCartEvent, ProductCartState> {
  ProductCartBloc() : super(const ProductCartState(quantity: 1)) {
    on<IncrementQuantity>((event, emit) {
      final newState = state.copyWith(quantity: state.quantity + 1);
      emit(newState);
    });

    on<DecrementQuantity>((event, emit) {
      final newState = state.copyWith(quantity: state.quantity - 1);
      emit(newState);
    });
  }
}
