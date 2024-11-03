import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class RefreshProductDetailsUseCase {
  final ProductDetailsRepository repository;

  RefreshProductDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ProductDetailsEntity>>> call() async {
    return await repository.refresh();
  }
}
