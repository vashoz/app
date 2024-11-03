import '../../../../core/shared/shared.dart';

class FavoriteEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  const FavoriteEntity({
    required this.guid,
  });

  factory FavoriteEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
