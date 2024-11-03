import '../../../../core/shared/shared.dart';
import '../../variant.dart';

class SearchVariantUseCase {
  final VariantRepository repository;

  SearchVariantUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<VariantEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
