import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

abstract class DashboardLocalDataSource {
  FutureOr<void> add({
    required DashboardEntity dashboard,
  });

  FutureOr<void> addAll({
    required List<DashboardEntity> items,
  });

  FutureOr<void> update({
    required DashboardEntity dashboard,
  });

  FutureOr<void> remove({
    required String guid,
  });

  FutureOr<void> removeAll();

  FutureOr<DashboardEntity> find({
    required String guid,
  });
}
