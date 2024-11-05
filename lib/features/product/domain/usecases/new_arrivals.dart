import '../../../../core/shared/shared.dart';
import '../../product.dart';

class NewArrivalProductsUseCase {
  final ProductsRepository repository;

  NewArrivalProductsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<String>>> call() async {
    return await repository.newArrivals();
  }
}
