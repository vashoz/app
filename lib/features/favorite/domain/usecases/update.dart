import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class UpdateFavoriteUseCase {
  final FavoriteRepository repository;

  UpdateFavoriteUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required FavoriteEntity favorite,
  }) async {
    return await repository.update(
      favorite: favorite,
    );
  }
}
