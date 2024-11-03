import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class ReviewsLocalDataSourceImpl extends ReviewsLocalDataSource {
  final Map<String, ReviewsEntity> _cache = {};

  @override
  FutureOr<void> add({
    required ReviewsEntity reviews,
  }) {
    _cache[reviews.guid] = reviews;
  }

  @override
  FutureOr<void> addAll({
    required List<ReviewsEntity> items,
  }) {
    for (final item in items) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required ReviewsEntity reviews,
  }) {
    _cache[reviews.guid] = reviews;
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
  FutureOr<ReviewsEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw ReviewsNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
