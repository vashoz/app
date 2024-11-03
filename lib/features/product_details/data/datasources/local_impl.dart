import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class ProductDetailsLocalDataSourceImpl extends ProductDetailsLocalDataSource {
  final Map<String, ProductDetailsEntity> _cache = {};

  @override
  FutureOr<void> add({
    required ProductDetailsEntity productDetails,
  }) {
    _cache[productDetails.guid] = productDetails;
  }

  @override
  FutureOr<void> addAll({
    required List<ProductDetailsEntity> items,
  }) {
    for (final item in items) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required ProductDetailsEntity productDetails,
  }) {
    _cache[productDetails.guid] = productDetails;
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
  FutureOr<ProductDetailsEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw ProductDetailsNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
