import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

typedef DashboardModelPaginatedResponse = ({
  List<DashboardModel> items,
  int total,
});

abstract class DashboardRemoteDataSource {
  FutureOr<void> create({
    required DashboardEntity dashboard,
  });

  FutureOr<void> delete({
    required String guid,
  });

  FutureOr<DashboardModel> find({
    required String guid,
  });

  FutureOr<DashboardModelPaginatedResponse> read({
    required int page,
    required int limit,
  });

  FutureOr<DashboardModelPaginatedResponse> refresh({
    required int page,
    required int limit,
  });

  FutureOr<DashboardModelPaginatedResponse> search({
    required int page,
    required int limit,
    required String query,
  });

  FutureOr<void> update({
    required DashboardEntity dashboard,
  });
}
