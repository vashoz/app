import '../../../../core/shared/shared.dart';
import '../../reviews.dart';

class ReviewsRepositoryImpl extends ReviewsRepository {
  final NetworkInfo network;
  final ReviewsLocalDataSource local;

  final ReviewsRemoteDataSource remote;

  ReviewsRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required ReviewsEntity reviews,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(reviews: reviews);

        await local.add(reviews: reviews);

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
  FutureOr<Either<Failure, ReviewsEntity>> find({
    required String guid,
  }) async {
    try {
      final result = await local.find(
        guid: guid,
      );
      return Right(result);
    } on ReviewsNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.find(
          guid: guid,
        );
        await local.add(reviews: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ReviewsEntity>>> read() async {
    try {
      if (await network.online) {
        final result = await remote.read();

        await local.addAll(items: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ReviewsEntity>>> refresh() async {
    try {
      if (await network.online) {
        await local.removeAll();

        final result = await remote.refresh();

        await local.addAll(items: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ReviewsEntity>>> search({
    required String query,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.search(
          query: query,
        );

        await local.addAll(items: result);

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
    required ReviewsEntity reviews,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(reviews: reviews);

        await local.update(reviews: reviews);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
