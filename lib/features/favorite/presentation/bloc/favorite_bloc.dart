import 'package:collection/collection.dart';

import '../../../../core/shared/shared.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<ToggleFavoriteProduct>((event, emit) {
      logic<String>(String product) => product == event.slug;
      if (state.products.any(logic)) {
        //! ---------remove favorite-------
        final favoriteProducts = state.products.whereNot(logic).toList();
        final newState = FavoriteState(products: favoriteProducts);
        emit(newState);
      } else {
        //* ---------add favorite-----------
        final favoriteProducts = state.products..add(event.slug);
        final newState = FavoriteState(products: favoriteProducts);
        emit(newState);
      }
    });
  }
}
