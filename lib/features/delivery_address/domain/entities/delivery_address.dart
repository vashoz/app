import '../../../../core/shared/shared.dart';

class DeliveryAddressEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  const DeliveryAddressEntity({
    required this.guid,
  });

  factory DeliveryAddressEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
