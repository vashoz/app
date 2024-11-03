import '../../../../core/shared/shared.dart';
import '../../category.dart';

class FindCategoryUseCase {
  final CategoriesRepository repository;

  FindCategoryUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, CategoryEntity>> call({
    required String slug,
  }) async {
    return await repository.find(
      slug: slug,
    );
  }
}
