import '../../../../core/shared/shared.dart';

class CheckoutEntity extends Equatable {
  final int id;

  const CheckoutEntity({
    required this.id,
  });

  factory CheckoutEntity.create() {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
