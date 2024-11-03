import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

typedef FavoriteEntityPaginatedResponse = ({
  List<FavoriteEntity> items,
  int total,
});

abstract class FavoriteRepository {
  FutureOr<Either<Failure, void>> create({
    required FavoriteEntity favorite,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, FavoriteEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, List<FavoriteEntity>>> read();

  FutureOr<Either<Failure, List<FavoriteEntity>>> refresh();

  FutureOr<Either<Failure, List<FavoriteEntity>>> search({
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required FavoriteEntity favorite,
  });
}
