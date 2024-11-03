import '../../../../core/shared/shared.dart';
import '../../search.dart';

class SearchSearchUseCase {
  final SearchRepository repository;

  SearchSearchUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<SearchEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
