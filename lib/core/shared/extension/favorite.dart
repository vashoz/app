import '../../../features/favorite/favorite.dart';

extension FavoriteStateExtension on FavoriteState {
  FavoriteState copyWith({
    List<String>? products,
  }) {
    return FavoriteState(
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> get toMap => {
    FavoriteState.key : products,
  };
}