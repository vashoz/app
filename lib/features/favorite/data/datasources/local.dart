import '../../../../core/shared/shared.dart';
import '../../favorite.dart';

abstract class FavoriteLocalDataSource {
  FutureOr<void> add({
    required FavoriteEntity favorite,
  });

  FutureOr<void> addAll({
    required List<FavoriteEntity> items,
  });

  FutureOr<void> update({
    required FavoriteEntity favorite,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<FavoriteEntity> find({
    required String guid,
  });
}
