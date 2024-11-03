import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class DeliveryAddressModel extends DeliveryAddressEntity {
  // TODO: implement model properties
  const DeliveryAddressModel({
    required super.guid,
  });

  factory DeliveryAddressModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      // TODO: implement parse
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw DeliveryAddressModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
