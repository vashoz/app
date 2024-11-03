import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class CreateFavoriteUseCase {
  final FavoriteRepository repository;

  CreateFavoriteUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required FavoriteEntity favorite,
  }) async {
    return await repository.create(
      favorite: favorite,
    );
  }
}
