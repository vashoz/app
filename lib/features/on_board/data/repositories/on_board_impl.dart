import '../../../../core/shared/shared.dart';
import '../../on_board.dart';

class OnBoardRepositoryImpl extends OnBoardRepository {
  final NetworkInfo network;
  final OnBoardRemoteDataSource remote;

  OnBoardRepositoryImpl({
    required this.network,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required OnBoardEntity onBoard,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(onBoard: onBoard);

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
  FutureOr<Either<Failure, OnBoardEntity>> find({
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
    } on OnBoardNotFoundInLocalCacheFailure catch (_) {
      return Left(_);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<OnBoardEntity>>> read() async {
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
  FutureOr<Either<Failure, List<OnBoardEntity>>> refresh() async {
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
  FutureOr<Either<Failure, List<OnBoardEntity>>> search({
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
    required OnBoardEntity onBoard,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(onBoard: onBoard);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
