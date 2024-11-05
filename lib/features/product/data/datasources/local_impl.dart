import '../../../../core/shared/shared.dart';
import '../../product.dart';

class ProductsLocalDataSourceImpl extends ProductsLocalDataSource {
  final Map<String, ProductEntity> _cache = {};
  final Map<String, List<String>> _find = {};
  List<String>? _newArrivals;
  List<String>? _popular;
  List<String>? _all;

  @override
  FutureOr<void> add({
    required String slug,
    required ProductEntity product,
  }) {
    _cache[slug] = product;
  }

  @override
  FutureOr<void> addAll({
    required List<ProductEntity> products,
  }) {
    for (final item in products) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required ProductEntity product,
  }) {
    _cache[product.guid] = product;
  }

  @override
  FutureOr<void> remove({
    required String slug,
  }) {
    _cache.remove(slug);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
  }

  @override
  FutureOr<ProductEntity> find({
    required String slug,
  }) {
    final item = _cache[slug];
    if (item == null) {
      throw ProductsNotFoundInLocalCacheFailure();
    }
    return item;
  }

  @override
  FutureOr<void> addCategory({
    required String slug,
    required List<String> products,
  }) {
    _find[slug] = products;
  }

  @override
  FutureOr<List<String>> findCategory({
    required String slug,
  }) async {
    if (_find.containsKey(slug)) {
      return _find[slug]!;
    } else {
      throw ProductsNotFoundInLocalCacheFailure();
    }
  }

  @override
  FutureOr<void> addNewArrivals({
    required List<String> products,
  }) {
    _newArrivals = products;
  }

  @override
  FutureOr<void> addPopular({required List<String> products}) {
    _popular = products;
  }

  @override
  FutureOr<List<String>> findNewArrivals() {
    if (_newArrivals == null) {
      throw ProductsNotFoundInLocalCacheFailure();
    }
    return _newArrivals!;
  }

  @override
  FutureOr<List<String>> findPopular() {
    if (_popular == null) {
      throw ProductsNotFoundInLocalCacheFailure();
    }
    return _popular!;
  }

  @override
  FutureOr<List<String>> findAll() {
    if (_all == null) {
      throw ProductsNotFoundInLocalCacheFailure();
    }
    return _all!;
  }
}
