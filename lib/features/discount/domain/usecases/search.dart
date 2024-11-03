import '../../../../core/shared/shared.dart';
import '../../discount.dart';

class SearchDiscountUseCase {
  final DiscountRepository repository;

  SearchDiscountUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<DiscountEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
