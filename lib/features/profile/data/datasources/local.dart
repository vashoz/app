import '../../../../core/shared/shared.dart';
import '../../profile.dart';

abstract class ProfileLocalDataSource {
  FutureOr<void> add({
    required ProfileEntity profile,
  });

  FutureOr<void> addAll({
    required List<ProfileEntity> items,
  });

  FutureOr<void> update({
    required ProfileEntity profile,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<ProfileEntity> find({
    required String guid,
  });
}
