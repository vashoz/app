import '../../../../core/shared/shared.dart';

class FilterEntity extends Equatable {
  // TODO: implement entity properties
  final int id;

  FilterEntity({
    required this.id,
  });

  factory FilterEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        id,
      ];
}
