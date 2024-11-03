import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class FindFavoriteUseCase {
  final FavoriteRepository repository;

  FindFavoriteUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, FavoriteEntity>> call({
    required String guid,
  }) async {
    return await repository.find(
      guid: guid,
    );
  }
}
