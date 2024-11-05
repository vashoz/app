import 'package:collection/collection.dart';
import 'package:vashoz/core/shared/extension/cart.dart';
import 'package:vashoz/features/product/product.dart';

import '../../../../core/shared/shared.dart';
import '../../cart.dart';
import '../../data/models/cart_item.dart';
import '../../data/models/model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends HydratedBloc<CartEvent, CartEntity?> {
  CartBloc() : super(null) {
    on<ClearCart>((event, emit) {
      emit(null);
    });

    on<AddToCartEvent>((event, emit) async {
      final CartItemEntity? existingItem = state?.items
          .firstWhereOrNull(
            (element) =>
                element ==
                CartItemEntity(
                  quantity: element.quantity,
                  product: event.product,
                ),
          )
          ?.copyWith();

      if (state == null) {
        final CartItemEntity item = CartItemEntity(
          product: event.product,
          quantity: event.quantity,
        );
        final cart = CartEntity(
          items: [item],
        );

        if (state != cart) {
          final navigator = Navigator.of(event.context);
          await Future.delayed(const Duration(milliseconds: 500));
          emit(cart);
          navigator.pushNamed(CartPage.name);
        }
      } else if (existingItem == null) {
        final updatedCart = state?.copyWith(
          items: [
            ...(state?.items ?? []),
            CartItemEntity(
              product: event.product,
              quantity: event.quantity,
            ),
          ],
        );
        if (state != updatedCart) {
          final navigator = Navigator.of(event.context);
          await Future.delayed(const Duration(milliseconds: 500));
          emit(updatedCart);
          navigator.pushNamed(CartPage.name);
        }
      } else {
        assert(state != null);

        final cart = state!.copyWith(items: state!.items);
        final updatedItem = existingItem.copyWith();
        final updatedCart = cart.copyWith(
          items: cart.items
              .map((e) => e == existingItem ? updatedItem ?? existingItem : e)
              .toList(),
        );
        if (state != updatedCart) {
          await Future.delayed(const Duration(milliseconds: 500));
          emit(updatedCart);
        }
      }
    });

    on<IncrementQuantityEvent>((event, emit) {
      assert(state != null);
      final cart = state!.copyWith();
      final index = cart.items.indexWhere((element) => element == event.item);
      final item = cart.items[index];
      final updatedItem = item.copyWith(quantity: item.quantity + 1);
      final updatedCart = cart.copyWith(
        items:
            cart.items.map((e) => e == item ? updatedItem ?? item : e).toList(),
      );
      emit(updatedCart);
    });

    on<DecrementQuantityEvent>((event, emit) {
      assert(state != null);
      final cart = state!.copyWith(items: state!.items);
      final index = cart.items.indexWhere((element) => element == event.item);
      final item = cart.items[index];
      final updatedItem = item.copyWith(quantity: item.quantity - 1);
      if ((updatedItem?.quantity ?? 0) > 0) {
        final updatedCart = cart.copyWith(
          items: cart.items
              .map((e) => e == item ? updatedItem ?? item : e)
              .toList(),
        );
        emit(updatedCart);
      } else {
        final updatedCart = cart.copyWith(
          items: cart.items.where((e) => e != item).toList(),
        );
        if (updatedCart.items.isEmpty) {
          add(const ClearCart());
        } else {
          emit(updatedCart);
        }
      }
    });
  }

  @override
  CartEntity? fromJson(Map<String, dynamic> json) {
    return json.isEmpty ? null : CartModel.parse(map: json);
  }

  @override
  Map<String, dynamic>? toJson(CartEntity? state) {
    return state?.toMap ?? {};
  }
}
