import '../../../../core/shared/shared.dart';
import '../../banner.dart';

abstract class BannerLocalDataSource {
  FutureOr<void> add({
    required List<BannerEntity> banners,
  });

  FutureOr<void> removeAll();

  FutureOr<List<BannerEntity>> find();
}
