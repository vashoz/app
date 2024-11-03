import '../../../../core/shared/shared.dart';
import '../../search.dart';

class SearchRepositoryImpl extends SearchRepository {
  final NetworkInfo network;
  final SearchRemoteDataSource remote;

  SearchRepositoryImpl({
    required this.network,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required SearchEntity search,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(search: search);

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
  FutureOr<Either<Failure, SearchEntity>> find({
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
    } on SearchNotFoundInLocalCacheFailure catch (_) {
      return Left(_);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<SearchEntity>>> read() async {
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
  FutureOr<Either<Failure, List<SearchEntity>>> refresh() async {
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
  FutureOr<Either<Failure, List<SearchEntity>>> search({
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
    required SearchEntity search,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(search: search);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
