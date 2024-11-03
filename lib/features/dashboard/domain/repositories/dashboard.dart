import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

typedef DashboardEntityPaginatedResponse = ({
  List<DashboardEntity> items,
  int total,
});

abstract class DashboardRepository {
  FutureOr<Either<Failure, void>> create({
    required DashboardEntity dashboard,
  });

  FutureOr<Either<Failure, void>> delete({
    required String guid,
  });

  FutureOr<Either<Failure, DashboardEntity>> find({
    required String guid,
  });

  FutureOr<Either<Failure, DashboardEntityPaginatedResponse>> read({
    required int page,
    required int limit,
  });

  FutureOr<Either<Failure, DashboardEntityPaginatedResponse>> refresh({
    required int page,
    required int limit,
  });

  FutureOr<Either<Failure, DashboardEntityPaginatedResponse>> search({
    required int page,
    required int limit,
    required String query,
  });

  FutureOr<Either<Failure, void>> update({
    required DashboardEntity dashboard,
  });
}
