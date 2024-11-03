import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class SearchCheckoutUseCase {
  final CheckoutRepository repository;

  SearchCheckoutUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, CheckoutEntityPaginatedResponse>> call({
    required int page,
    required int limit,
    required String query,
  }) async {
    return await repository.search(
      page: page,
      limit: limit,
      query: query,
    );
  }
}
