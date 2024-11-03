import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class TrackOrderLocalDataSourceImpl extends TrackOrderLocalDataSource {
  final Map<String, TrackOrderEntity> _cache = {};

  @override
  FutureOr<void> add({
    required TrackOrderEntity trackOrder,
  }) {
    _cache[trackOrder.orderId] = trackOrder;
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
    required TrackOrderEntity trackOrder,
  }) {
    _cache[trackOrder.orderId] = trackOrder;
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
  FutureOr<TrackOrderEntity> find({
    required int id,
  }) {
    final item = _cache[id];
    if (item == null) {
      throw TrackOrderNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
