import '../../../../core/shared/shared.dart';
import '../../orders.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  final NetworkInfo network;
  final OrdersLocalDataSource local;

  final OrdersRemoteDataSource remote;

  OrdersRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, List<TrackOrderEntity>>> findAll({
    required String guid,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.findAll(
          guid: guid,
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
  FutureOr<Either<Failure, List<TrackOrderEntity>>> refresh({
    required String guid,
  }) async {
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
}
