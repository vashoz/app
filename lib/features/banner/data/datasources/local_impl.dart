import '../../../../core/shared/shared.dart';
import '../../banner.dart';

class BannerLocalDataSourceImpl extends BannerLocalDataSource {
  List<BannerEntity>? _cache;

  @override
  FutureOr<void> add({
    required List<BannerEntity> banners,
  }) {
    _cache = banners;
  }

  @override
  FutureOr<void> removeAll() {
    _cache = null;
  }

  @override
  FutureOr<List<BannerEntity>> find() {
    if (_cache == null) {
      throw BannerNotFoundInLocalCacheFailure();
    }
    return _cache!;
  }
}
