import '../../../../core/shared/shared.dart';
import '../../auth.dart';

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final Map<String, AuthEntity> _cache = {};

  @override
  FutureOr<void> add({
    required AuthEntity auth,
  }) {
    _cache[auth.guid] = auth;
  }

  @override
  FutureOr<void> addAll({
    required List<AuthEntity> items,
  }) {
    for (final item in items) {
      _cache[item.guid] = item;
    }
  }

  @override
  FutureOr<void> update({
    required AuthEntity auth,
  }) {
    _cache[auth.guid] = auth;
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
  FutureOr<AuthEntity> find({
    required String guid,
  }) {
    final item = _cache[guid];
    if (item == null) {
      throw AuthNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
