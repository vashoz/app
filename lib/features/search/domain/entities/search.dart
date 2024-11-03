import '../../../../core/shared/shared.dart';

class SearchEntity extends Equatable {
  final int id;

  const SearchEntity({
    required this.id,
  });

  factory SearchEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
