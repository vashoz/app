import '../../../../core/shared/shared.dart';
import '../../shipping_method.dart';

class ShippingMethodRepositoryImpl extends ShippingMethodRepository {
  final NetworkInfo network;
  final ShippingMethodLocalDataSource local;

  final ShippingMethodRemoteDataSource remote;

  ShippingMethodRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  @override
  FutureOr<Either<Failure, void>> create({
    required ShippingMethodEntity shippingMethod,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.create(shippingMethod: shippingMethod);

        await local.add(shippingMethod: shippingMethod);

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
  FutureOr<Either<Failure, ShippingMethodEntity>> find({
    required int id,
  }) async {
    try {
      final result = await local.find(
        id: id,
      );
      return Right(result);
    } on ShippingMethodNotFoundInLocalCacheFailure catch (_) {
      if (await network.online) {
        final result = await remote.find(
          id: id,
        );
        await local.add(shippingMethod: result);
        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, List<ShippingMethodEntity>>> read() async {
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
  FutureOr<Either<Failure, List<ShippingMethodEntity>>> refresh() async {
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
  FutureOr<Either<Failure, List<ShippingMethodEntity>>> search({
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
    required ShippingMethodEntity shippingMethod,
  }) async {
    try {
      if (await network.online) {
        final result = await remote.update(shippingMethod: shippingMethod);

        await local.update(shippingMethod: shippingMethod);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
