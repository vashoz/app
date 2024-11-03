import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class CreateProductDetailsUseCase {
  final ProductDetailsRepository repository;

  CreateProductDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required ProductDetailsEntity productDetails,
  }) async {
    return await repository.create(
      productDetails: productDetails,
    );
  }
}
