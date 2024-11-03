import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class FavoriteLocalDataSourceImpl extends FavoriteLocalDataSource {
  final Map<String, FavoriteEntity> _cache = {};

  @override
  FutureOr<void> add({
    required FavoriteEntity favorite,
  }) {
    _cache[favorite.guid] = favorite;
  }

  @override
  FutureOr<void> addAll({
    required List<FavoriteEntity> items,
  }) {
    for (final item in items) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required FavoriteEntity favorite,
  }) {
    _cache[favorite.guid] = favorite;
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
  FutureOr<FavoriteEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw FavoriteNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
