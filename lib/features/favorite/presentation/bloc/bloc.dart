import '../../../../core/shared/shared.dart';

part 'event.dart';
part 'state.dart';

class FavoriteBloc extends HydratedBloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<MakeFavorite>((event, emit) {
      final products = state.products.clone;

      if (state.products.has(text: event.slug)) {
        products.remove(event.slug);
      } else {
        products.add(event.slug);
      }

      emit(state.copyWith(products: products));
    });
  }

  @override
  FavoriteState? fromJson(Map<String, dynamic> json) {
    return FavoriteState.parse(json: json);
  }

  @override
  Map<String, dynamic>? toJson(FavoriteState state) {
    return state.toMap;
  }
}
