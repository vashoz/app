import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class SearchFilterUseCase {
  final FilterRepository repository;

  SearchFilterUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<FilterEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
