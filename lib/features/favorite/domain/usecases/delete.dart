import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class DeleteFavoriteUseCase {
  final FavoriteRepository repository;

  DeleteFavoriteUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call({
    required String guid,
  }) async {
    return await repository.delete(
      guid: guid,
    );
  }
}
