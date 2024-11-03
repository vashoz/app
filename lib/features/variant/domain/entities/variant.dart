import '../../../../core/shared/shared.dart';

class VariantEntity extends Equatable {
  final String guid;
  final int price;
  final int size;
  final String unit;
  final String type;

  const VariantEntity({
    required this.guid,
    required this.price,
    required this.size,
    required this.unit,
    required this.type,
  });

  @override
  List<Object?> get props => [
        guid,
        price,
        size,
        unit,
        type,
      ];

  get toMap {
    return {
      'guid': guid,
      'price': price,
      'size': size,
      'unit': unit,
      'type': type,
    };
  }
}
