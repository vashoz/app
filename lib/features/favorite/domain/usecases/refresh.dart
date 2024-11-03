import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class RefreshFavoriteUseCase {
  final FavoriteRepository repository;

  RefreshFavoriteUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<FavoriteEntity>>> call() async {
    return await repository.refresh();
  }
}
