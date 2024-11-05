import '../../../../core/shared/shared.dart';
import '../../product.dart';

class PopularProductsUseCase {
  final ProductsRepository repository;

  PopularProductsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<String>>> call() async {
    return await repository.popular();
  }
}
