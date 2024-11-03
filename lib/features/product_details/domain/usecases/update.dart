import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class UpdateProductDetailsUseCase {
  final ProductDetailsRepository repository;

  UpdateProductDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required ProductDetailsEntity productDetails,
  }) async {
    return await repository.update(
      productDetails: productDetails,
    );
  }
}
