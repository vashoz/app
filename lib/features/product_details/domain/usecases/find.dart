import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class FindProductDetailsUseCase {
  final ProductDetailsRepository repository;

  FindProductDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, ProductDetailsEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
