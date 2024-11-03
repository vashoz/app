part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<String> products;

  const FavoriteState({this.products = const []});
  FavoriteState copyWith({List<String>? products}) {
    return FavoriteState(
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [products];
}

class FavoriteInitial extends FavoriteState {
  FavoriteInitial() : super(products: []);
}
