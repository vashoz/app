import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class VariantLocalDataSourceImpl extends VariantLocalDataSource {
  final Map<String, VariantEntity> _cache = {};

  @override
  FutureOr<void> add({
    required VariantEntity variant,
  }) {
    _cache[variant.guid] = variant;
  }

  @override
  FutureOr<void> addAll({
    required List<VariantEntity> items,
  }) {
    for (final item in items) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required VariantEntity variant,
  }) {
    _cache[variant.guid] = variant;
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
  FutureOr<VariantEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw VariantNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
