import '../../../../core/shared/shared.dart';
import '../../category.dart';

class CategoriesLocalDataSourceImpl extends CategoriesLocalDataSource {
  final Map<String, CategoryEntity> _cache = {};
  final Map<String, List<String>> _search = {};
  List<String>? _all;
  List<String>? _featured;

  @override
  FutureOr<void> add({
    required String slug,
    required CategoryEntity category,
  }) async {
    _cache[slug] = category;
  }

  @override
  FutureOr<void> addAll({
    required List<String> categories,
  }) async {
    _all = categories;
  }

  @override
  FutureOr<void> addFeatured({
    required List<String> categories,
  }) async {
    _featured = categories;
  }

  @override
  FutureOr<void> addSearch({
    required String query,
    required List<String> categories,
  }) async {
    _search[query] = categories;
  }

  @override
  FutureOr<CategoryEntity> find({
    required String slug,
  }) async {
    if (_cache.containsKey(slug)) {
      return _cache[slug]!;
    } else {
      throw CategoriesNotFoundInLocalCacheFailure();
    }
  }

  @override
  FutureOr<List<String>> findAll() {
    if (_all == null) {
      throw CategoriesNotFoundInLocalCacheFailure();
    }
    return _all!;
  }

  @override
  FutureOr<List<String>> findFeatured() {
    if (_featured == null) {
      throw CategoriesNotFoundInLocalCacheFailure();
    }
    return _featured!;
  }

  @override
  FutureOr<List<String>> findSearch({
    required String query,
  }) async {
    if (_search.containsKey(query)) {
      return _search[query]!;
    } else {
      throw CategoriesNotFoundInLocalCacheFailure();
    }
  }

  @override
  FutureOr<void> remove({
    required String slug,
  }) async {
    _cache.remove(slug);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
    _all = null;
    _featured = null;
    _search.clear();
  }
}
