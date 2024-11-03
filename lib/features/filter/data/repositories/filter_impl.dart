import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FilterRepositoryImpl extends FilterRepository {
  final NetworkInfo network;
  final FilterRemoteDataSource remote;

  FilterRepositoryImpl({
    required this.network,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required FilterEntity filter,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(filter: filter);

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
    required int id,
  }) async {
    try {
      if (await network.online) {
        await remote.delete(
          id: id,
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
  FutureOr<Either<Failure, FilterEntity>> find({
    required int id,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.find(
          id: id,
        );

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on FilterNotFoundInLocalCacheFailure catch (_) {
      return Left(_);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<FilterEntity>>> read() async {
    try {
      if (await network.online) {
        final result = await remote.read();

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<FilterEntity>>> refresh() async {
    try {
      if (await network.online) {
        final result = await remote.refresh();

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<FilterEntity>>> search({
    required String query,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.search(
          query: query,
        );

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> update({
    required FilterEntity filter,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(filter: filter);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
