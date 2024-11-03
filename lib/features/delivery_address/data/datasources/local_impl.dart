import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class DeliveryAddressLocalDataSourceImpl
    extends DeliveryAddressLocalDataSource {
  final Map<String, DeliveryAddressEntity> _cache = {};

  @override
  FutureOr<void> add({
    required DeliveryAddressEntity deliveryAddress,
  }) {
    _cache[deliveryAddress.guid] = deliveryAddress;
  }

  @override
  FutureOr<void> addAll({
    required List<DeliveryAddressEntity> items,
  }) {
    for (final item in items) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required DeliveryAddressEntity deliveryAddress,
  }) {
    _cache[deliveryAddress.guid] = deliveryAddress;
  }

  @override
  FutureOr<void> remove({
    required String guid,
  }) {
    _cache.remove(guid);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
  }

  @override
  FutureOr<DeliveryAddressEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw DeliveryAddressNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
