import '../../../../core/shared/shared.dart';
import '../../auth.dart';

abstract class AuthLocalDataSource {
  FutureOr<void> add({
    required AuthEntity auth,
  });

  FutureOr<void> addAll({
    required List<AuthEntity> items,
  });

  FutureOr<void> update({
    required AuthEntity auth,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<AuthEntity> find({
    required String guid,
  });
}
