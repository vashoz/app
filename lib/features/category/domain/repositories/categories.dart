import '../../../../core/shared/shared.dart';
import '../../category.dart';

abstract class CategoriesRepository {
  FutureOr<Either<Failure, CategoryEntity>> find({
    required String slug,
  });

  FutureOr<Either<Failure, List<String>>> featured();

  FutureOr<Either<Failure, List<String>>> all();

  FutureOr<Either<Failure, List<String>>> refresh();

  FutureOr<Either<Failure, List<String>>> search({
    required String query,
  });
}
