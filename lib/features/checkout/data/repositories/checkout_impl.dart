import '../../../../core/shared/shared.dart';
import '../../checkout.dart';

class CheckoutRepositoryImpl extends CheckoutRepository {
  final NetworkInfo network;
  final CheckoutRemoteDataSource remote;

  CheckoutRepositoryImpl({
    required this.network,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required CheckoutEntity checkout,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(checkout: checkout);

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
  FutureOr<Either<Failure, CheckoutEntity>> find({
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
    } on CheckoutNotFoundInLocalCacheFailure catch (_) {
      return Left(_);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, CheckoutEntityPaginatedResponse>> read({
    required int page,
    required int limit,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.read(
          page: page,
          limit: limit,
        );

        return Right((items: result.items, total: result.total));
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, CheckoutEntityPaginatedResponse>> refresh({
    required int page,
    required int limit,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.refresh(
          page: page,
          limit: limit,
        );

        return Right((items: result.items, total: result.total));
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, CheckoutEntityPaginatedResponse>> search({
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
    required CheckoutEntity checkout,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(checkout: checkout);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
