import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

class ReadFavoriteUseCase {
  final FavoriteRepository repository;

  ReadFavoriteUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, List<FavoriteEntity>>> call() async {
    return await repository.read();
  }
}
