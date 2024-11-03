import '../../../../core/shared/shared.dart';
import '../../category.dart';

abstract class CategoriesLocalDataSource {
  FutureOr<void> add({
    required String slug,
    required CategoryEntity category,
  });

  FutureOr<void> addAll({
    required List<String> categories,
  });

  FutureOr<void> addFeatured({
    required List<String> categories,
  });

  FutureOr<void> addSearch({
    required String query,
    required List<String> categories,
  });

  FutureOr<void> remove({
    required String slug,
  });

  FutureOr<void> removeAll();

  FutureOr<CategoryEntity> find({
    required String slug,
  });

  FutureOr<List<String>> findAll();

  FutureOr<List<String>> findFeatured();

  FutureOr<List<String>> findSearch({
    required String query,
  });
}
