import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class VariantModel extends VariantEntity {
  const VariantModel({
    required super.guid,
    required super.price,
    required super.size,
    required super.unit,
    required super.type,
  });

  factory VariantModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      return VariantModel(
        guid: map['guid'],
        price: map['price'],
        size: map['size'],
        unit: map['unit'],
        type: map['type'],
      );
    } catch (e, stackTrace) {
      throw VariantModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Map<String, dynamic> get toMap {
    return {
      'guid': guid,
      'price': price,
      'size': size,
      'unit': unit,
      'type': type,
    };
  }
}
