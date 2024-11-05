import '../../../../core/shared/shared.dart';
import '../../product.dart';

class FindProductUseCase {
  final ProductsRepository repository;

  FindProductUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, ProductEntity>> call({
    required String slug,
  }) async {
    return await repository.find(
      slug: slug,
    );
  }
}
