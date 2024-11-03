import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

abstract class DeliveryAddressRemoteDataSource {
  FutureOr<void> create({
    required DeliveryAddressEntity deliveryAddress,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<DeliveryAddressModel> find({
    required String guid,
  });

  FutureOr<List<DeliveryAddressModel>> read();

  FutureOr<List<DeliveryAddressModel>> refresh();

  FutureOr<List<DeliveryAddressModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required DeliveryAddressEntity deliveryAddress,
  });
}
