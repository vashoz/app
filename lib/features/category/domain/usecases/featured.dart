import '../../../../core/shared/shared.dart';
import '../../category.dart';

class FeaturedCategoriesUseCase {
  final CategoriesRepository repository;

  FeaturedCategoriesUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<String>>> call() async {
    return await repository.featured();
  }
}
