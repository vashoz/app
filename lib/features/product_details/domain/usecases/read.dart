import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class ReadProductDetailsUseCase {
  final ProductDetailsRepository repository;

  ReadProductDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ProductDetailsEntity>>> call() async {
    return await repository.read();
  }
}
