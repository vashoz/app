import '../../../../core/shared/shared.dart';

class ShippingMethodEntity extends Equatable {
  // TODO: implement entity properties
  final int id;

  const ShippingMethodEntity({
    required this.id,
  });

  factory ShippingMethodEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        id,
      ];
}
