import '../../../../core/shared/shared.dart';
import '../../product.dart';

class CategoryUseCase {
  final ProductsRepository repository;

  CategoryUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<String>>> call({
    required String slug,
  }) async {
    return await repository.category(
      slug: slug,
    );
  }
}
