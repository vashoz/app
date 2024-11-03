part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class ToggleFavoriteProduct extends FavoriteEvent {
  final String slug;

  const ToggleFavoriteProduct({
    required this.slug,
  });

  @override
  List<Object> get props => [slug];
}
