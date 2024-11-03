import '../../../../core/shared/shared.dart';
import '../../track_order.dart';

class TrackOrderRepositoryImpl extends TrackOrderRepository {
  final NetworkInfo network;
  final TrackOrderLocalDataSource local;

  final TrackOrderRemoteDataSource remote;

  TrackOrderRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required TrackOrderEntity trackOrder,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(trackOrder: trackOrder);

        await local.add(trackOrder: trackOrder);

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

        await local.remove(
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
  FutureOr<Either<Failure, TrackOrderEntity>> find({
    required int id,
  }) async {
    try {
      final result = await local.find(
        id: id,
      );
      return Right(result);
    } on TrackOrderNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.find(
          id: id,
        );
        await local.add(trackOrder: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, TrackOrderEntity>> read({
    required String orderId,
    required String email,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.read(
          orderId: orderId,
          email: email,
        );

        await local.add(trackOrder: result);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<TrackOrderEntity>>> refresh() async {
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
  FutureOr<Either<Failure, List<TrackOrderEntity>>> search({
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
    required TrackOrderEntity trackOrder,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(trackOrder: trackOrder);

        await local.update(trackOrder: trackOrder);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
