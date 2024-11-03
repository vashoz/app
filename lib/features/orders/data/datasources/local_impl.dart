import '../../../../core/shared/shared.dart';
import '../../orders.dart';

class OrdersLocalDataSourceImpl extends OrdersLocalDataSource {
  final Map<String, TrackOrderEntity> _cache = {};

  @override
  FutureOr<void> add({
    required TrackOrderEntity orders,
  }) {
    _cache[orders.orderId] = orders;
  }

  @override
  FutureOr<void> addAll({
    required List<TrackOrderEntity> items,
  }) {
    for (final item in items) {
      _cache[item.orderId] = item;
    }
  }

  @override
  FutureOr<void> update({
    required TrackOrderEntity orders,
  }) {
    _cache[orders.orderId] = orders;
  }

  @override
  FutureOr<void> remove({
    required String orderId,
  }) {
    _cache.remove(orderId);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
  }

  @override
  FutureOr<TrackOrderEntity> find({
    required String orderId,
  }) {
    final item = _cache[orderId];
    if (item == null) {
      throw OrdersNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
