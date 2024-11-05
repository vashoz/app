part of 'bloc.dart';

class FavoriteState extends Equatable {
  static const String key = "favorite";
  final List<String> products;

  const FavoriteState({this.products = const []});

  factory FavoriteState.parse({
    required Map<String, dynamic> json,
  }) {
    if (!json.containsKey(key)) {
      return const FavoriteState();
    }
    return FavoriteState(
      products: List<String>.from(json[key]),
    );
  }

  @override
  List<Object> get props => [products];
}
