import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class DashboardLocalDataSourceImpl extends DashboardLocalDataSource {
  final Map<String, DashboardEntity> _cache = {};

  @override
  FutureOr<void> add({
    required DashboardEntity dashboard,
  }) {
    _cache[dashboard.guid] = dashboard;
  }

  @override
  FutureOr<void> addAll({
    required List<DashboardEntity> items,
  }) {
    for (final item in items) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required DashboardEntity dashboard,
  }) {
    _cache[dashboard.guid] = dashboard;
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
  FutureOr<DashboardEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw DashboardNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
