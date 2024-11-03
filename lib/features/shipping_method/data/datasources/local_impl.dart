import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class ShippingMethodLocalDataSourceImpl extends ShippingMethodLocalDataSource {
  final Map<int, ShippingMethodEntity> _cache = {};

  @override
  FutureOr<void> add({
    required ShippingMethodEntity shippingMethod,
  }) {
    _cache[shippingMethod.id] = shippingMethod;
  }

  @override
  FutureOr<void> addAll({
    required List<ShippingMethodEntity> items,
  }) {
    for (final item in items) {
      _cache[item.id] = item;
    }
  }

  @override
  FutureOr<void> update({
    required ShippingMethodEntity shippingMethod,
  }) {
    _cache[shippingMethod.id] = shippingMethod;
  }

  @override
  FutureOr<void> remove({
    required int id,
  }) {
    _cache.remove(id);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
  }

  @override
  FutureOr<ShippingMethodEntity> find({
    required int id,
  }) {
    final item = _cache[id];
    if (item == null) {
      throw ShippingMethodNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
