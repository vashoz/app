import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class ShippingMethodModel extends ShippingMethodEntity {
  // TODO: implement model properties
  const ShippingMethodModel({
    required super.id,
  });

  factory ShippingMethodModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw ShippingMethodModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
