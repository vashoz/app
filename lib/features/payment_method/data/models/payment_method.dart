import '../../../../core/shared/shared.dart';
import '../../payment_method.dart';

class PaymentMethodModel extends PaymentMethodEntity {
  // TODO: implement model properties
  const PaymentMethodModel({
    required super.guid,
  });

  factory PaymentMethodModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw PaymentMethodModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
