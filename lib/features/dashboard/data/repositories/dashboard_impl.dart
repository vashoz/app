import '../../../../core/shared/shared.dart';
import '../../dashboard.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final NetworkInfo network;
  final DashboardLocalDataSource local;

  final DashboardRemoteDataSource remote;

  DashboardRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required DashboardEntity dashboard,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(dashboard: dashboard);

        await local.add(dashboard: dashboard);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> delete({
    required String guid,
  }) async {
    try {
      if (await network.online) {
        await remote.delete(
          guid: guid,
        );

        await local.remove(
          guid: guid,
        );

        return const Right(null);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, DashboardEntity>> find({
    required String guid,
  }) async {
    try {
      final result = await local.find(
        guid: guid,
      );
      return Right(result);
    } on DashboardNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.find(
          guid: guid,
        );
        await local.add(dashboard: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, DashboardEntityPaginatedResponse>> read({
    required int page,
    required int limit,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.read(
          page: page,
          limit: limit,
        );

        await local.addAll(items: result.items);

        return Right((items: result.items, total: result.total));
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, DashboardEntityPaginatedResponse>> refresh({
    required int page,
    required int limit,
  }) async {
    try {
      if (await network.online) {
        await local.removeAll();

        final result = await remote.refresh(
          page: page,
          limit: limit,
        );

        await local.addAll(items: result.items);

        return Right((items: result.items, total: result.total));
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, DashboardEntityPaginatedResponse>> search({
    required int page,
    required int limit,
    required String query,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.search(
          page: page,
          limit: limit,
          query: query,
        );

        await local.addAll(items: result.items);

        return Right((items: result.items, total: result.total));
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> update({
    required DashboardEntity dashboard,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(dashboard: dashboard);

        await local.update(dashboard: dashboard);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
