import '../../../../core/shared/shared.dart';

class ProductDetailsEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  const ProductDetailsEntity({
    required this.guid,
  });

  factory ProductDetailsEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
