import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class DeleteProductDetailsUseCase {
  final ProductDetailsRepository repository;

  DeleteProductDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
