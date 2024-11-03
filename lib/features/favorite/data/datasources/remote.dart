import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

abstract class FavoriteRemoteDataSource {
  FutureOr<void> create({
    required FavoriteEntity favorite,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<FavoriteModel> find({
    required String guid,
  });

  FutureOr<List<FavoriteModel>> read();

  FutureOr<List<FavoriteModel>> refresh();

  FutureOr<List<FavoriteModel>> search({
    required String query,
  });

  FutureOr<void> update({
    required FavoriteEntity favorite,
  });
}
