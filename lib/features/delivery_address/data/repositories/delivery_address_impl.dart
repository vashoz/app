import '../../../../core/shared/shared.dart';
import '../../delivery_address.dart';

class DeliveryAddressRepositoryImpl extends DeliveryAddressRepository {
  final NetworkInfo network;
  final DeliveryAddressLocalDataSource local;

  final DeliveryAddressRemoteDataSource remote;

  DeliveryAddressRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required DeliveryAddressEntity deliveryAddress,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(deliveryAddress: deliveryAddress);

        await local.add(deliveryAddress: deliveryAddress);

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
  FutureOr<Either<Failure, DeliveryAddressEntity>> find({
    required String guid,
  }) async {
    try {
      final result = await local.find(
        guid: guid,
      );
      return Right(result);
    } on DeliveryAddressNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.find(
          guid: guid,
        );
        await local.add(deliveryAddress: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<DeliveryAddressEntity>>> read() async {
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
  FutureOr<Either<Failure, List<DeliveryAddressEntity>>> refresh() async {
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
  FutureOr<Either<Failure, List<DeliveryAddressEntity>>> search({
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
    required DeliveryAddressEntity deliveryAddress,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(deliveryAddress: deliveryAddress);

        await local.update(deliveryAddress: deliveryAddress);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
