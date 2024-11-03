import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class CheckoutModel extends CheckoutEntity {
  const CheckoutModel({
    required super.id,
  });

  factory CheckoutModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw CheckoutModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
