import '../../../../core/shared/shared.dart';
import '../../category.dart';

abstract class CategoriesRemoteDataSource {
  FutureOr<CategoryModel> find({
    required String slug,
  });

  FutureOr<List<String>> featured();

  FutureOr<List<String>> all();

  FutureOr<List<String>> search({
    required String query,
  });
}
