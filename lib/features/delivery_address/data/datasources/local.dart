import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

abstract class DeliveryAddressLocalDataSource {
  FutureOr<void> add({
    required DeliveryAddressEntity deliveryAddress,
  });

  FutureOr<void> addAll({
    required List<DeliveryAddressEntity> items,
  });

  FutureOr<void> update({
    required DeliveryAddressEntity deliveryAddress,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<DeliveryAddressEntity> find({
    required String guid,
  });
}
