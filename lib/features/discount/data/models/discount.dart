import '../../../../core/shared/shared.dart';
import '../../discount.dart';

class DiscountModel extends DiscountEntity {
  const DiscountModel({
    required super.amount,
    required super.type,
    required super.expireDate,
  });

  factory DiscountModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      return DiscountModel(
        amount: map['amount'] ?? 0,
        type: map['type'],
        expireDate: map['expires'],
      );
    } catch (e, stackTrace) {
      throw DiscountModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
