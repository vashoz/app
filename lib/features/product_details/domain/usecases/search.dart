import '../../../../core/shared/shared.dart';
import '../../product_details.dart';

class SearchProductDetailsUseCase {
  final ProductDetailsRepository repository;

  SearchProductDetailsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<ProductDetailsEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
