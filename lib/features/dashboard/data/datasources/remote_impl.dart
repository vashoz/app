import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class DashboardRemoteDataSourceImpl extends DashboardRemoteDataSource {
  final Client client;

  DashboardRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> create({
    required DashboardEntity dashboard,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> delete({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<DashboardModel> find({
    required String guid,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<DashboardModelPaginatedResponse> read({
    required int page,
    required int limit,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<DashboardModelPaginatedResponse> refresh({
    required int page,
    required int limit,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<DashboardModelPaginatedResponse> search({
    required int page,
    required int limit,
    required String query,
  }) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> update({
    required DashboardEntity dashboard,
  }) async {
    throw UnimplementedError();
  }
}
