import '../../../../core/shared/shared.dart';
import '../../cart.dart';

class SearchCartUseCase {
  final CartRepository repository;

  SearchCartUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<CartEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
