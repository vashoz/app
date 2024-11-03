import '../../../../core/shared/shared.dart';

class PaymentMethodEntity extends Equatable {
  // TODO: implement entity properties
  final String guid;

  const PaymentMethodEntity({
    required this.guid,
  });

  factory PaymentMethodEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        guid,
      ];
}
