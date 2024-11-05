part of 'bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class MakeFavorite extends FavoriteEvent {
  final String slug;

  const MakeFavorite({
    required this.slug,
  });

  @override
  List<Object> get props => [slug];
}
