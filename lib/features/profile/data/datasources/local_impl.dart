import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  final Map<String, ProfileEntity> _cache = {};

  @override
  FutureOr<void> add({
    required ProfileEntity profile,
  }) {
    _cache[profile.guid] = profile;
  }

  @override
  FutureOr<void> addAll({
    required List<ProfileEntity> items,
  }) {
    for (final item in items) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required ProfileEntity profile,
  }) {
    _cache[profile.guid] = profile;
  }

  @override
  FutureOr<void> remove({
    required String guid,
  }) {
    _cache.remove(guid);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
  }

  @override
  FutureOr<ProfileEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw ProfileNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
