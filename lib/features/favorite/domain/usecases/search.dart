import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class SearchFavoriteUseCase {
  final FavoriteRepository repository;

  SearchFavoriteUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<FavoriteEntity>>> call({
    required String query,
  }) async {
    return await repository.search(
      query: query,
    );
  }
}
